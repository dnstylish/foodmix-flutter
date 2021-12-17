import 'package:flutter/material.dart';
import 'package:foodmix/components/search/search_input.dart';
import 'package:foodmix/components/search/search_results.dart';
import 'package:foodmix/components/search/search_title.dart';
import 'package:foodmix/components/search/select_category.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:foodmix/viewModels/search_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              const SearchTitle(),
              const SizedBox(height: 20),
              const SearchInputView(),
              const SizedBox(height: 20),
              const SearchSelectCategory(),
              const SizedBox(height: 20),
              (() => viewModel.showSearch ? const SearchResult() : const SearchPlaceholder())(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPlaceholder extends StatelessWidget {
  const SearchPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
        'assets/lottie/cooking.json',
        width: 200
    );
  }
}

