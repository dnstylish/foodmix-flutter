import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/content_shimmer.dart';
import 'package:foodmix/models/category.dart';
import 'package:foodmix/viewModels/category_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../const.dart';

class CategoryInfo extends ViewModelWidget<CategoryViewModel> {
  const CategoryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (() => viewModel.isReady
            ? const Text('Giới thiệu', style: kTextH4)
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
        SizedBox(height: viewModel.isReady ? 5 : 10),
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.isReady ? Text(categoryExample.content, style: kTextContent) : const _RecipeContentPlaceholder(),
        )
      ],
    );
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
