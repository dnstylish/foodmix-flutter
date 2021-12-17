// ViewModel
import 'package:flutter/material.dart';
import 'package:foodmix/actions/network_action.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/actions/scroll_actions.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/recipe.dart';

class CategoryViewModel extends ChangeNotifier with NetworkAction, ResponseActions, ScrollActions {
  final String slug;

  Category? category;
  List<Recipe> recipes = [];

  bool isReady = false;
  bool isGetFirst = false;
  bool isLoading = true;
  bool isNoMore = false;

  int page = 0;
  int count = 0;

  CategoryViewModel({ required this.slug });

  void initialise() {
    _getCategory();
    _setupController();
  }

  Future<void> _getCategory() async {
    try {

      NetworkResponse response = await $get('/categories/$slug');
      category = makeCategory(response.data)!;
      await _getCount();
      isReady = true;
      notifyListeners();

    } catch (_) {}
  }

  Future<void> _getCount() async {
    try {
      NetworkResponse response = await $get('/categories/$slug/count');
      count = response.data as int;
    } catch (_) {}
  }

  Future<void> getRecipes() async {
    isLoading = true;
    try {
      NetworkResponse response = await $get('/categories/$slug/recipes', query: _getRecipesQuery);
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

  void getFirst() async {
    if(isGetFirst || !isReady) {
      return;
    }
    isGetFirst = true;
    getRecipes();
  }

  void _setupController() {
    scrollController.addListener(() {
      setShowProcess(180);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Map<String, dynamic> get _getRecipesQuery => {'order': 'createdAt', 'page': page, 'limit': 10 };

}
