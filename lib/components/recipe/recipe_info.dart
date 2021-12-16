
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/content_shimmer.dart';
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

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.isReady
                ? _RecipeTitle(title: viewModel.recipe?.name ?? '', users: viewModel.bookMarkers, total: viewModel.recipe?.countBookmark ?? 0)
                : const _RecipeTitlePlaceholder()
          ),

          const SizedBox(
            height: 10,
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.isReady
                ? _RecipeSubTitle(title1: '${viewModel.recipe?.time} Phút | ${viewModel.recipe?.category?.name}', title2: 'Hơn ${viewModel.recipe?.countBookmark} sưu tập')
                : const _RecipeSubTitlePlaceHolder(),
          ),

          const SizedBox(
            height: 15,
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.isReady ? _RecipeContent(content: '${viewModel.recipe?.content}') : const _RecipeContentPlaceholder(),
          ),

          const SizedBox(height: 25),
          const RecipeIngredients(),
        ],
      ),
    );
  }
}

class _RecipeContent extends StatelessWidget {
  const _RecipeContent({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(content, style: kTextContent);
  }
}
class _RecipeContentPlaceholder extends StatelessWidget {
  const _RecipeContentPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 14,
            decoration: BoxDecoration(
              borderRadius: kPrimaryRadius,
              color: Colors.grey
            )
          ),
          const SizedBox(
            height: 8,
          ),

          Container(
              width: double.infinity,
              height: 14,
              decoration: BoxDecoration(
                  borderRadius: kPrimaryRadius,
                  color: Colors.grey
              )
          ),
          const SizedBox(
            height: 8,
          ),

          Container(
              width: double.infinity,
              height: 14,
              decoration: BoxDecoration(
                  borderRadius: kPrimaryRadius,
                  color: Colors.grey
              )
          ),
          const SizedBox(
            height: 8,
          ),

          Container(
              width: (MediaQuery.of(context).size.width - 40) * 0.7,
              height: 14,
              decoration: BoxDecoration(
                  borderRadius: kPrimaryRadius,
                  color: Colors.grey
              )
          ),
          const SizedBox(
            height: 8,
          ),

          Container(
              width: (MediaQuery.of(context).size.width - 40) * 0.5,
              height: 14,
              decoration: BoxDecoration(
                  borderRadius: kPrimaryRadius,
                  color: Colors.grey
              )
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}



class _RecipeSubTitle extends StatelessWidget {
  const _RecipeSubTitle({Key? key, required this.title1, required this.title2,}) : super(key: key);

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title1, style: const TextStyle(color: Colors.grey)),
        Text(title2, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
class _RecipeSubTitlePlaceHolder extends StatelessWidget {
  const _RecipeSubTitlePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentShimmer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: kPrimaryRadius
            ),
          ),

          Container(
            width: 60,
            height: 14,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: kPrimaryRadius
            ),
          )
        ],
      ),
    );
  }
}


class _RecipeTitle extends StatelessWidget {
  const _RecipeTitle({ Key? key, required this.title, required this.users, required this.total }) : super(key: key);

  final String title;
  final List<User> users;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(title, style: kTextH3)
        ),

        SizedBox(
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
        )

      ],
    );
  }
}
class _RecipeTitlePlaceholder extends StatelessWidget {
  const _RecipeTitlePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ContentShimmer(
              child: Container(
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
              ),
            )
        ),

        SizedBox(
          width: 40 + 3 * 25,
          height: 40,
          child: Stack(
            children: List.generate(3, (index) => Positioned(
                right: (3 - index) * 15,
                child: ContentShimmer(
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366f1),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(40),
                      )
                  ),
                )
            )),
          ),
        )


      ],
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
