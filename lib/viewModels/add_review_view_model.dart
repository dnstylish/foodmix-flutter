import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:foodmix/actions/auth_action.dart';
import 'package:foodmix/actions/network_action.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/review.dart';

class AddReviewViewMode extends BaseViewModel with NetworkAction, ResponseActions, AuthAction {

  Recipe recipe;
  String content = '';

  bool isLoading = false;

  List<RatingPoint> points = [
    RatingPoint(content: 'Hướng Dẫn Có Tâm'),
    RatingPoint(content: 'Món Ăn Dễ Nấu'),
    RatingPoint(content: 'Nguyên Liệu Dễ Tìm'),
    RatingPoint(content: 'Giá Thành Thực Hiện')
  ];

  AddReviewViewMode({ required this.recipe });

  created() {}


  double get rating {
    int _total = points.reduce((value, element) => RatingPoint(content: '', rating: value.rating + element.rating)).rating;
    return _total / 4;
  }

  setPoint({ required int index, required int point }) {
    points[index].rating = point + 1;
    notifyListeners();
  }

  Future<void> submit() async {
    if(!canSubmit) {
      return;
    }
    isLoading = true;
    notifyListeners();

    try {

      NetworkResponse response = await $post('/recipes/${recipe.slug}/review', data: { 'content': content, 'rating': rating });

      Review _review = Review(
          user: currentUser!,
          content: content,
          rating: response.data['review']['rating'].toDouble(),
          createdAt: response.data['review']['createdAt']
      );

      Navigator.pop(server.context!,
          {
            'review': _review,
            'countRating': response.data['recipe']['countRating'],
            'rating': response.data['recipe']['rating']
          }
      );

    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  void setContent(String text) {
    content = text;
    notifyListeners();
  }

  bool get canSubmit {
    return content.length >= 50 && points.every((element) => element.rating > 0) && !isLoading;
  }

}

class RatingPoint {
  int rating;
  String content;
  
  RatingPoint({ this.rating = 0, required this.content });
}