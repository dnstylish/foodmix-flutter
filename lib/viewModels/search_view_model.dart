// ViewModel
import 'package:foodmix/actions/api_actions.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/user.dart';
import 'package:foodmix/viewModels/home_view_model.dart';

class SearchViewModel extends HomeViewModel {
  String category = '';
  String keyword = '';
  bool showSearch = false;

  @override
  void initialise() {
    super.getCategories();
  }

  Future<void> getSearch() async {
    if(keyword == '') {
      return;
    }
    showSearch = true;
    isLoading = true;
    notifyListeners();
    try {
      ServerResponse response = await $get('/search', query: { 'keyword': keyword, 'page': page, 'limit': 10 });
      List<dynamic> results = response.data as List<dynamic>;
      for (var element in results) {
        recipes.add(Recipe(
            name: element['name'],
            slug: element['slug'],
            avatar: element['avatar'],
            rating: (element['rating'] as int).toDouble(),
            time: element['time'],
            user: User(
                email: element['user']['email'],
                avatar: element['user']['avatar'],
                name: element['user']['name'])
        ),
        );
      }
      page++;
    } catch (_) {}
    notifyListeners();
    isLoading = false;
  }

  void submitSearch() {
    page = 0;
    recipes = [];
    getSearch();
  }

  void selectCategory(String _category) {
    var selectedCategory = categories.indexWhere((element) => element.name == _category);
    if(selectedCategory > -1 && categories[selectedCategory].slug != category) {
      category = categories[selectedCategory].slug;
      page = 0;
      recipes = [];
      getSearch();
    }
  }
}