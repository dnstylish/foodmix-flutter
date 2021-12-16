import 'package:flutter/material.dart';
import 'package:foodmix/components/recipe/recipe_overlay.dart';
import 'package:foodmix/components/recipe/recipe_tab_bar.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../const.dart';

class RecipeAppBar extends ViewModelWidget<RecipeViewModel> {
  const RecipeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return SliverAppBar(
      centerTitle: false,
      elevation: 0.0,
      pinned: true,
      expandedHeight: 250,
      stretch: true,
      backgroundColor: kPrimary.withOpacity(viewModel.showPress),
      title: AnimatedSwitcher(duration: const Duration(milliseconds: 300), child: viewModel.isReady ? const RecipeTabBar() : Container()),
      leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop()
      ),
      actions: [
        IconButton(icon: const Icon(Icons.bookmark), onPressed: () => viewModel.toggleIsReady())
      ],
      flexibleSpace: const FlexibleSpaceBar(
          background: RecipeOverlay()
      ),
    );
  }
}