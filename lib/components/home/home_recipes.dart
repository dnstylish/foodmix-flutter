import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/loading_view.dart';
import 'package:foodmix/components/includes/recipe_item.dart';
import 'package:foodmix/components/includes/primary_button.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/viewModels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeRecipes extends ViewModelWidget<HomeViewModel> {
  const HomeRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.recipes.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: kGridRecipesLayout,
                    itemBuilder: (_, int index) =>
                        RecipeItem(recipe: viewModel.recipes[index]),
                    itemCount: viewModel.recipes.length,
                  )
                : Container()),
        const SizedBox(
          height: 20,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: viewModel.isNoMore
              ? const LoadingView(title: 'Mọi thứ tới đây thôi...')
              : viewModel.isLoading
                  ? const LoadingView()
                  : PrimaryButton(callback: () => viewModel.getRecipes()),
        )
      ],
    );
  }
}
