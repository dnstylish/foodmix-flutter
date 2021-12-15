// ViewModel
import 'package:flutter/material.dart';
import 'package:foodmix/actions/api_actions.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/recipe.dart';

class CategoryViewModel extends ChangeNotifier with ServerAction, ResponseActions {
  final String slug;

  Category category = categoryExample;
  List<Recipe> recipes = recipesExample;

  int page = 0;
  int limit = 10;
  bool isReady = false;
  int count = 0;

  CategoryViewModel({ required this.slug });

  void initialise() {
    _getCategory();
  }

  Future<void> _getCategory() async {
    try {

      ServerResponse response = await $get('/categories/$slug');
      category = makeCategory(response.data)!;
      await _getCount();
      notifyListeners();

    } catch (_) {}
  }

  Future<void> _getCount() async {
    try {
      ServerResponse response = await $get('/categories/$slug/count');
      count = response.data as int;
    } catch (_) {}
  }

  Future<void> getRecipes() async {
    try {

    } catch (_) {}
  }

}
