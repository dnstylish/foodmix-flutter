import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/content_shimmer.dart';
import 'package:foodmix/components/includes/recipe_item.dart';
import 'package:foodmix/viewModels/category_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../const.dart';

class CategoryResults extends ViewModelWidget<CategoryViewModel> {
  const CategoryResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return VisibilityDetector(
      key: const Key('category-result'),
      onVisibilityChanged: (VisibilityInfo info) => viewModel.getFirst(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          (() => viewModel.isReady
              ? const Text('Công Thức', style: kTextH4)
              : ContentShimmer(
              child: Container(
                height: 22,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: kPrimaryRadius
                ),
              )
          ))(),

          const SizedBox(height: 15),

          AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: viewModel.recipes.isNotEmpty ? const _GridRecipes() : Container()
          ),
        ],
      ),
    );
  }
}

class _GridRecipes extends ViewModelWidget<CategoryViewModel> {
  const _GridRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: kGridRecipesLayout,
      itemBuilder: (_, int index) =>
          RecipeItem(recipe: viewModel.recipes[index]),
      itemCount: viewModel.recipes.length,
    );
  }
}

