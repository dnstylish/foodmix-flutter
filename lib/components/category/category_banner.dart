import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/category_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoryBanner extends ViewModelWidget<CategoryViewModel> {
  const CategoryBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: viewModel.$cdn(viewModel.category.avatar),
        width: double.infinity,
        height: (MediaQuery.of(context).size.width - 40) * 320 / 600,
        fit: BoxFit.cover,
      ),
    );
  }
}
