import 'package:foodmix/actions/cdn_action.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/user.dart';

class Review with CDNAction {
  final User user;
  final Recipe? recipe;
  final String content;
  final double rating;
  final int createdAt;

  Review({ required this.user, this.recipe, required this.content, required this.rating, required this.createdAt });
}

final reviewExample = Review(
    content: 'Nhiều nguyên liệu lạ quá, tôi không biết. Đề nghị ship cho tôi nguyên liệu để tôi nấu. (freeship nhé)',
    rating: 3,
    createdAt: 765436543,
    user: userExample
);