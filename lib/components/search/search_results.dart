import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/loading_view.dart';
import 'package:foodmix/components/includes/recipe_item.dart';
import 'package:foodmix/components/includes/show_more_button.dart';
import 'package:foodmix/viewModels/search_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchResult extends ViewModelWidget<SearchViewModel> {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    return Expanded(child: SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Kết quả tìm kiếm:'),
        const SizedBox(
          height: 20,
        ),
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.recipes.isNotEmpty ? GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 15 / 8,
                mainAxisSpacing: 25,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (_, int index) =>
                  RecipeItem(recipe: viewModel.recipes[index]),
              itemCount: viewModel.recipes.length,
            ) : Container()
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !viewModel.isLoading ? const Center(child:  LoadingView()) : ShowMoreButton(callback: () => viewModel.getSearch()
          ),
        )
      ],
    )));
  }
}
