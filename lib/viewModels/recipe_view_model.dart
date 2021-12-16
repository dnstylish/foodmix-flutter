// ViewModel
import 'package:flutter/material.dart';
import 'package:foodmix/actions/api_actions.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/actions/scroll_actions.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/review.dart';
import 'package:foodmix/models/user.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecipeViewModel extends ChangeNotifier with ServerAction, ScrollActions, ResponseActions {
  final String slug;

  Recipe? recipe;
  List<User> bookMarkers = bookMarkersExample;
  List<Review> reviews = reviewsExample;

  int serving = 1;
  bool isReady = false;

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
      ServerResponse response = await $get('/recipes/$slug');
      recipe = makeRecipe(response.data)!;
      isReady = true;
      notifyListeners();
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

final List<Review> reviewsExample = [reviewExample, reviewExample, reviewExample];
