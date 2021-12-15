import 'package:foodmix/actions/cdn_action.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/models/user.dart';

class Recipe with CDNAction {
  final String name;
  final String slug;
  final String avatar;
  final String content;
  final Category? category;
  final User? user;
  final List<Ingredient> ingredients;
  final List<RecipeStepper> stepper;
  final String? time;
  final String? preparation;
  final double? rating;
  final int? views;
  final int? countRating;
  final int countBookmark;
  final int? createdAt;

  Recipe({
    required this.name,
    required this.slug,
    required this.avatar,
    this.content = '',
    this.category,
    this.user,
    this.ingredients = const [],
    this.stepper = const [],
    this.time,
    this.preparation,
    this.rating,
    this.views,
    this.countBookmark = 0,
    this.countRating = 0,
    this.createdAt
  });

}

class Ingredient {
  final String name;
  final int count;
  final String unit;

  Ingredient({ required this.name, required this.count, required this.unit });

}

class RecipeStepper {
  final String content;
  final String image;

  RecipeStepper({ required this.content, this.image = '' });

}

final List<Recipe> recipesExample = [recipeExample, recipeExample, recipeExample, recipeExample, recipeExample];

final Recipe recipeExample = Recipe(
    name: 'Bún Sườn Mọc Chua',
    slug: 'slug',
    avatar: 'https://api.foodmix.xyz/images/users/61b4641e53050d21cbe36a15/recipe/1c3f7f51-a9e1-4e91-a3ef-9844d8e06819.jpg',
    time: '00:10',
    content: 'Những ngày thời tiết hơi oi bức một chút thì vị giác chúng mình sẽ luôn hướng tới những món ăn đơn giản',
    category: Category(name: 'Ăn Trưa', avatar: '', slug: ''),
    ingredients: [ingredientExample, ingredientExample, ingredientExample, ingredientExample, ingredientExample],
    countBookmark: 100,
    stepper: [stepperExample, stepperExample, stepperExample, stepperExample, stepperExample]
);

final Ingredient ingredientExample = Ingredient(name: 'Hành Lá', count: 3, unit: 'Cọng');
final RecipeStepper stepperExample = RecipeStepper(
    content: 'Đun nóng chút dầu ăn, cho sườn vào xào. Sườn bắt đầu săn và ngấm gia vị thì đổ nước lạnh ngập mặt sườn. Đun sôi trở lại rồi hạ xuống lửa nhỏ đun liu riu (hớt bọt nếu có).',
    image: 'https://api.foodmix.xyz/images/users/61b4641e53050d21cbe36a15/recipe/ce373a59-5e08-4bd5-8092-10080fd38758.jpg'
);