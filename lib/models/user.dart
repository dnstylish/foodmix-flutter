import 'package:foodmix/actions/cdn_action.dart';

class User with CDNAction {
  final String name;
  final String avatar;
  final String banner;
  final String email;
  final String about;
  final String province;
  final double rating;
  final int countRating;
  final int countRecipe;
  final int createdAt;

  User({ required this.name, required this.avatar, this.banner = '', required this.email, this.about = '', this.province = '', this.rating = 0, this.countRating = 0, this.countRecipe = 0, this.createdAt = 0 });
}

final User userExample = User(name: 'Yuan', avatar: 'https://api.foodmix.xyz/images/users/61b6f0e56dafbe89c336551b/avatar/bb6ed296-73f7-45f0-af64-58b8f4c0d6c3.jpg', email: 'email');