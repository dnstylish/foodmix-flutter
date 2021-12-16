import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/content_shimmer.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipeIngredients extends ViewModelWidget<RecipeViewModel> {
  const RecipeIngredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: viewModel.isReady ? const _IngredientsToolBar() : const _IngredientsToolBarPlaceholder(),
        ),

        const SizedBox(height: 20),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: viewModel.isReady ? const _IngredientsTable() : const _IngredientsTablePlaceholder(),
        )

      ],
    );
  }
}

class _IngredientsToolBar  extends ViewModelWidget<RecipeViewModel> {
  const _IngredientsToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Thành Phần (${viewModel.recipe?.ingredients.length})', style: kTextH4),
              const SizedBox(height: 5),
              const Text('Bạn có bao nhiêu người ăn', style: TextStyle(color: Colors.grey))
            ],
          ),
        ),

        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Opacity(
                opacity: viewModel.serving > 1 ? 1 : 0.5,
                child: IconButton(
                    onPressed: () => viewModel.popServing(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.remove)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('${viewModel.serving}'),
              ),
              IconButton(
                  onPressed: () => viewModel.pushServing(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.add)
              )
            ],
          ),
        )
      ],
    );
  }
}
class _IngredientsToolBarPlaceholder extends StatelessWidget {
  const _IngredientsToolBarPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentShimmer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: kPrimaryRadius
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 14,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: kPrimaryRadius
                  ),
                )
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
            ),
            width: 70,
            height: 35,
          )
        ],
      ),
    );
  }
}

class _IngredientsTable extends ViewModelWidget<RecipeViewModel> {
  const _IngredientsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return Column(
      children:
      (viewModel.recipe?.ingredients ?? []).map(
              (e) => RecipeIngredientItem(ingredient: Ingredient(name: e.name, count: e.count * viewModel.serving, unit: e.unit))
      ).toList(),
    );
  }
}

class _IngredientsTablePlaceholder extends StatelessWidget {
  const _IngredientsTablePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(15),
          child: ContentShimmer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( width: 150, height: 15, decoration: BoxDecoration( color: Colors.grey, borderRadius: kPrimaryRadius ) ),
                Container( width: 80, height: 15, decoration: BoxDecoration( color: Colors.grey, borderRadius: kPrimaryRadius ) )
              ],
            ),
          ),
        ),
      )),
    );
  }
}



class RecipeIngredientItem extends StatelessWidget {
  const RecipeIngredientItem({
    Key? key, required this.ingredient,
  }) : super(key: key);

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
                child: Text(ingredient.name, style: const TextStyle(fontSize: 15))
            ),
            Text('${ingredient.count} ${ingredient.unit}', style: const TextStyle(fontSize: 15))
          ],
        ),
      ),
    );
  }
}
