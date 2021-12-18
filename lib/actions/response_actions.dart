import 'package:flutter/material.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/review.dart';
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
          countRating: raw['countRating'] as int,
          time: raw['time'],
          content: raw['content'] ?? '',
          user: makeUser(raw['user']),
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

  @protected
  User? makeUser(dynamic raw) {
    try {
      return User(
          name: raw['name'],
          avatar: raw['avatar'],
          email: raw['email'],
          banner: raw['banner'] ?? '',
          about: raw['about'] ?? '',
          province: raw['province'] ?? '',
          rating: raw['rating'] != null ? raw['rating'].toDouble() : 0,
          countRating: raw['countRating'] != null ? raw['countRating'].toInt() : 0,
          countRecipe: raw['countRecipe'] != null ? raw['countRecipe'].toInt() : 0,
          createdAt: raw['createdAt'] != null ? raw['createdAt'].toDouble() : 0
      );
    } catch (e) {
      return null;
    }
  }

  @protected
  Review? makeReview(dynamic raw) {
    try {
      return Review(
          user: makeUser(raw['user']) as User,
          content: raw['content'],
          rating: raw['rating'].toDouble(),
          createdAt: raw['createdAt']
      );
    } catch (e) {
      return null;
    }
  }
}
