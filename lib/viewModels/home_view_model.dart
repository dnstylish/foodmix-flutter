// ViewModel
import 'package:flutter/material.dart';
import 'package:foodmix/actions/api_actions.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/recipe.dart';

class HomeViewModel extends ChangeNotifier with ServerAction, ResponseActions {
  List<Category> categories = [];
  List<Recipe> recipes = [];

  int page = 0;
  int limit = 10;

  bool isNoMore = false;
  bool isLoading = false;
  bool isLoadingCategories = false;

  void initialise() {
    getCategories();
    getRecipes();
  }

  Future<void> getCategories() async {
    isLoadingCategories = true;
    notifyListeners();
    try {
      ServerResponse response = await $get('/categories');
      List<dynamic> results = response.data as List<dynamic>;
      // xoá dữ liệu mẫu
      categories = [];
      for (var element in results) {
        categories.add(makeCategory(element)!);
      }
      isLoadingCategories = false;
      notifyListeners();
    } catch (_) {}
  }

  Future<void> getRecipes() async {
    isLoading = true;
    notifyListeners();
    try {
      ServerResponse response = await $get('/recipes', query: _getRecipesQuery);
      List<dynamic> results = response.data as List<dynamic>;
      for (var element in results) {
        recipes.add(makeRecipe(element)!);
      }
      isNoMore = results.isEmpty;
      page++;
      isLoading = false;
      notifyListeners();
    } catch (_) {}
  }

  Map<String, dynamic> get _getRecipesQuery => {'order': 'createdAt', 'page': page, 'limit': limit };
}
