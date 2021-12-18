// ViewModel
import 'package:flutter/material.dart';
import 'package:foodmix/actions/auth_action.dart';
import 'package:foodmix/actions/network_action.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/actions/scroll_actions.dart';
import 'package:foodmix/components/recipe/recipe_add_review_form.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/review.dart';
import 'package:foodmix/models/user.dart';
import 'package:foodmix/views/login_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecipeViewModel extends BaseViewModel with NetworkAction, ScrollActions, ResponseActions, AuthAction {
  final String slug;

  Recipe? recipe;
  List<User> bookMarkers = bookMarkersExample;

  int serving = 1;
  bool isReady = false;
  bool isBookmark = false;
  bool isBookmarking = false;

  List<Review> reviews = [];
  int pageReviews = 0;
  bool isGetReviewsFirst = false;
  bool isGettingReview = false;
  bool isNoMoreReviews = false;

  List<InViewElement> inViews = [ InViewElement(name: 'info'), InViewElement(name: 'stepper'), InViewElement(name: 'reviews') ];


  GlobalKey infoKey = GlobalKey();
  GlobalKey stepperKey = GlobalKey();
  GlobalKey reviewsKey = GlobalKey();

  RecipeViewModel({required this.slug});

  void initialise() {
    getRecipe();
    _setupController();
  }

  InViewElement get currentView => inViews.reduce((value, element) => element.process < value.process ? value : element);

  Future<void> getRecipe() async {
    try {
      NetworkResponse response = await $get('/recipes/$slug');
      recipe = makeRecipe(response.data)!;
      isReady = true;
      notifyListeners();
      checkBookmark();
    } catch (_) { }
  }

  void _setupController() {
    scrollController.addListener(() {
      setShowProcess(180);
      notifyListeners();
    });
  }

  void setCurrentView(VisibilityInfo visibilityInfo, int index) {
    inViews[index].process = visibilityInfo.visibleFraction * 100;
    notifyListeners();
  }

  pushServing() {
    serving++;
    notifyListeners();
  }

  popServing() {
    if (serving <= 1) {
      return;
    }
    serving--;
    notifyListeners();
  }

  void toggleIsReady() {
    isReady = !isReady;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> checkBookmark() async {
    if(!auth) {
      return;
    }
    try {
      NetworkResponse response = await $get('/recipes/$slug/bookmark');
      isBookmark = response.data as bool;
    } catch (_) {}
  }

  Future<void> bookmarkAction() async {
    if(isBookmarking || !auth) {
      return;
    }
    isBookmarking = true;
    notifyListeners();

    if(isBookmark) {
     await _deleteBookmark();
    } else {
     await _addBookmark();
    }

    isBookmarking = false;
    notifyListeners();
  }

  Future<void> _addBookmark() async {
    try {
      await $post('/recipes/$slug/bookmark');
      isBookmark = true;
    } catch (_) {}
  }

  Future<void> _deleteBookmark() async {
    try {
      await $delete('/recipes/$slug/bookmark');
      isBookmark = false;
    } catch(_) {}
  }
  
  Future<void> getReviews() async {
    if(isGettingReview) {
      return;
    }
    isGettingReview = true;
    try {
      
      NetworkResponse response = await $get('/recipes/$slug/reviews', query: { 'page': pageReviews, 'limit': 5, 'order': 'createdAt' });
      List<dynamic> results = response.data as List<dynamic>;
      for (var element in results) {
        reviews.add(makeReview(element)!);
      }
      pageReviews++;
      if(results.isEmpty) {
        isNoMoreReviews = true;
      }
      
    } catch (_) {}
    isGettingReview = false;
    notifyListeners();
  }

  Future<void> getReviewFirst() async {
    if(isGetReviewsFirst) {
      return;
    }
    isGetReviewsFirst = true;
    await getReviews();
  }

  Future<void> openReviewModal(BuildContext context) async {
    if(!auth) {
      // chưa đăng nhập
      // do something
      await Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
      notifyListeners();
      return;
    }

    try {

      Map<String, dynamic>? result = await showBarModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => AddReviewForm(recipe: recipe!),
      );
      if(result != null) {
        reviews.insert(0, result['review']);
        // scrollTo(reviewsKey);
        notifyListeners();
      }

    } catch (_) {}
  }

}


class InViewElement {
  final String name;
  double process;

  InViewElement({ required this.name, this.process = 0 });
}


final List<User> bookMarkersExample = [
  User(
      name: 'Yuan',
      avatar:
          'https://api.foodmix.xyz/images/users/61b4641e53050d21cbe36a15/avatar/25d977ca-2601-4213-b667-c932041342d1.jpg',
      email: ''),
  User(
      name: 'Yuan',
      avatar:
          'https://api.foodmix.xyz/images/users/61b6f2216dafbe89c3365602/avatar/5aaf7dd4-9339-45ec-a210-29e1c18fb915.jpg',
      email: ''),
  User(
      name: 'Yuan',
      avatar:
          'https://api.foodmix.xyz/images/users/619cf2c7fa9117bdc16897aa/recipe/138027c4-422e-4aa7-9c79-0954c4b9c060.jpg',
      email: ''),
  User(
      name: 'Yuan',
      avatar:
          'https://api.foodmix.xyz/images/users/619cf2c7fa9117bdc16897aa/avatar/13a28574-4370-4fcc-b8c3-c8ef715d6790.jpg',
      email: '')
];