import 'package:flutter/material.dart';
import 'package:foodmix/components/category/category_results.dart';
import 'package:foodmix/components/includes/show_more_button.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/viewModels/category_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key, required this.slug}) : super(key: key);
  final String slug;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      viewModelBuilder: () => CategoryViewModel(slug: slug),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(viewModel.category.name),
          backgroundColor: kPrimary,
          elevation: 0.0,
          centerTitle: false,
          leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()
          ),
          actions: [
            IconButton(icon: Icon(Icons.share), onPressed: () {})
          ],
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: viewModel.recipes.isNotEmpty ? const CategoryResults() : Container(),
                  ),

                  ShowMoreButton(callback: () => {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

