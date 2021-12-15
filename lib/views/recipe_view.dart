import 'package:flutter/material.dart';
import 'package:foodmix/components/recipe/recipe_appbar.dart';
import 'package:foodmix/components/recipe/recipe_info.dart';
import 'package:foodmix/components/recipe/recipe_ingredients.dart';
import 'package:foodmix/components/recipe/recipe_reviews.dart';
import 'package:foodmix/components/recipe/recipe_stepper.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';


class RecipeView extends StatelessWidget {
  const RecipeView({Key? key, required this.slug}) : super(key: key);

  final String slug;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(
      viewModelBuilder: () => RecipeViewModel(slug: slug),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        body: CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            const RecipeAppBar(),
            SliverToBoxAdapter(
              // hasScrollBody: true,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: const [
                      RecipeInfo(),
                      // SizedBox(height: 25),
                      // RecipeReviews(),
                      SizedBox(height: 25),
                      RecipeStepperView(),
                      SizedBox(height: 25),
                      RecipeReviews()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
