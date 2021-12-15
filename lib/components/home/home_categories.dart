import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/content_shimmer.dart';
import 'package:foodmix/models/category.dart';
import 'package:stacked/stacked.dart';

import 'package:foodmix/viewModels/home_view_model.dart';
import 'package:foodmix/views/category_view.dart';

class HomeCategories extends ViewModelWidget<HomeViewModel> {
  const HomeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 50,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: viewModel.isLoadingCategories ? const _CategoriesExample() : ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, int index) => _CategoryItem(category: viewModel.categories[index]),
          itemCount: viewModel.categories.length,
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key, required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryView(slug: category.slug))),
        child: Chip(
            backgroundColor: Colors.black.withOpacity(0.05),
            padding: const EdgeInsets.all(10),
            label: Text(
                category.name,
                style: const TextStyle(color: Color(0xFF6366f1), fontWeight: FontWeight.w500)
            )
        ),
      ),
    );
  }
}

class _CategoriesExample extends StatelessWidget {
  const _CategoriesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentShimmer(
        child:  ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext ctx, int index) => _CategoryItem(category: categoryExample),
          itemCount: 4,
        )
    );
  }
}

