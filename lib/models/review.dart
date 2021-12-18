import 'package:foodmix/actions/cdn_action.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/models/user.dart';

class Review with CDNAction {
  final User user;
  final Recipe? recipe;
  final String content;
  final double? rating;
  final int createdAt;

  Review({ required this.user, this.recipe, required this.content, this.rating, required this.createdAt });
}