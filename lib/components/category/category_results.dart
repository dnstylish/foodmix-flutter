import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/recipe_item.dart';
import 'package:foodmix/viewModels/category_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../const.dart';

class CategoryResults extends ViewModelWidget<CategoryViewModel> {
  const CategoryResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: viewModel.recipes.isNotEmpty ? GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: kGridRecipesLayout,
          itemBuilder: (_, int index) =>
              RecipeItem(recipe: viewModel.recipes[index]),
          itemCount: viewModel.recipes.length,
        ) : Container()
    );
  }
}
