import 'package:flutter/material.dart';
import 'package:foodmix/components/category/category_appbar.dart';
import 'package:foodmix/components/category/category_info.dart';
import 'package:foodmix/components/category/category_results.dart';
import 'package:foodmix/components/includes/loading_view.dart';
import 'package:foodmix/components/includes/primary_button.dart';
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
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: viewModel.scrollController,
          slivers: [
            const CategoryAppBar(),
            SliverToBoxAdapter(
              // hasScrollBody: true,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const CategoryInfo(),
                      const SizedBox(height: 20),
                      const CategoryResults(),
                      const SizedBox(height: 20),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: viewModel.isNoMore
                            ? const LoadingView(title: 'Mọi thứ tới đay thôi...')
                            : viewModel.isLoading
                                ? const LoadingView()
                                : PrimaryButton(callback: () => viewModel.getRecipes()),
                      )
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
