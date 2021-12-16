import 'package:flutter/material.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/user.dart';

class ResponseActions {
  @protected
  Recipe? makeRecipe(dynamic raw) {
    try {
      return Recipe(
          name: raw['name'],
          slug: raw['slug'],
          avatar: raw['avatar'],
          rating: (raw['rating'] as int).toDouble(),
          time: raw['time'],
          content: raw['content'] ?? '',
          user: User(
              email: raw['user']['email'],
              avatar: raw['user']['avatar'],
              name: raw['user']['name']
          ),
          category: raw['category'] == null ? null : makeCategory(raw['category']),
          stepper: raw['stepper'] == null ? [] : makeListStepper(raw['stepper']),
          ingredients: raw['ingredients'] == null ? [] : makeListIngredient(raw['ingredients'])
      );
    } catch (e) {
      return null;
    }
  }

  @protected
  Category? makeCategory(dynamic raw) {
    try {
      return Category(
          name: raw['name'],
          avatar: raw['avatar'],
          slug: raw['slug'],
          content: raw['content'] ?? '');
    } catch (e) {
      return null;
    }
  }

  @protected
  List<RecipeStepper> makeListStepper(dynamic raw) {
    try {
      return (raw as List<dynamic>).map((e) => RecipeStepper(content: e['content'], image: e['image'])).toList();
    } catch (e) {
      return [];
    }
  }

  @protected
  List<Ingredient> makeListIngredient (dynamic raw) {
    try {
      return (raw as List<dynamic>).map((e) => Ingredient( name: e['name'], count: e['count'] as int, unit: e['unit'])).toList();
    } catch (e) {
      return [];
    }
  }
}
