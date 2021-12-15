
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/components/recipe/recipe_ingredients.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/models/user.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecipeInfo extends ViewModelWidget<RecipeViewModel> {
  const RecipeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return VisibilityDetector(
      key: const Key('info'),
      onVisibilityChanged: (VisibilityInfo info) => viewModel.setCurrentView(info, 0),
      child: Column(
        key: viewModel.infoKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(viewModel.recipe.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500))
              ),

              TopBookmark(users: viewModel.bookMarkers, total: viewModel.recipe.countBookmark)

            ],
          ),

          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${viewModel.recipe.time} Phút | ${viewModel.recipe.category?.name}', style: const TextStyle(color: Colors.grey)),
              Text('Hơn ${viewModel.recipe.countBookmark} sưu tập', style: const TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(
            height: 15,
          ),

          Text(viewModel.recipe.content, style: kTextContent),

          const SizedBox(height: 25),
          const RecipeIngredients(),
        ],
      ),
    );
  }
}

class TopBookmark extends StatelessWidget {
  const TopBookmark({Key? key, required this.users, required this.total}) : super(key: key);

  final List<User> users;
  final int total;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40 + (users.length - 1) * 25,
      height: 40,
      child: Stack(
        children: [
          ...users.asMap().map(
                  (index, user) => MapEntry(
                  index,
                  TopBookMarkItem(user: user, index: index, count: users.length)
              )
          ).values.toList(),

          Positioned(
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF6366f1),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text('${total > 100 ? "100" : total }+', style: const TextStyle(color: Colors.white, fontSize: 10)),
                ),
              )
          )

        ],
      ),
    );
  }
}

class TopBookMarkItem extends StatelessWidget {
  const TopBookMarkItem({
    Key? key, required this.user, required this.index, required this.count,
  }) : super(key: key);

  final User user;
  final int index;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: (count - index) * 15,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(40),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(imageUrl: user.cdn(user.avatar), width: 40, height: 40, fit: BoxFit.cover),
          ),
        )
    );
  }
}


class RecipeInfoItem extends StatelessWidget {
  const RecipeInfoItem({
    Key? key, required this.icon, required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(
          height: 10,
        ),
        Text(label)
      ],
    );
  }
}
