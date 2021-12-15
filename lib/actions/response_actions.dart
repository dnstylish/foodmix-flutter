import 'package:flutter/material.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/user.dart';

class ResponseActions {

  @protected Recipe? makeRecipe(dynamic raw) {
    try {
      return Recipe(
          name: raw['name'],
          slug: raw['slug'],
          avatar: raw['avatar'],
          rating: (raw['rating'] as int).toDouble(),
          time: raw['time'],
          user: User(
              email: raw['user']['email'],
              avatar: raw['user']['avatar'],
              name: raw['user']['name']
          )
      );
    } catch (e) {
      return null;
    }
  }

  @protected Category? makeCategory(dynamic raw) {
    try {
      return Category(
          name: raw['name'],
          avatar: raw['avatar'],
          slug: raw['slug'],
          content: raw['content'] ?? ''
      );
    } catch (e) {
      return null;
    }
  }

}