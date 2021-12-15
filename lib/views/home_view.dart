import 'package:flutter/material.dart';
import 'package:foodmix/components/home/home_banner.dart';
import 'package:foodmix/components/home/home_categories.dart';
import 'package:foodmix/components/home/home_recipes.dart';
import 'package:foodmix/components/home/home_search.dart';
import 'package:foodmix/components/home/home_title.dart';
import 'package:foodmix/viewModels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
        child: Column(children: const [
          HomeTitle(),
          SizedBox(
            height: 20,
          ),
          HomeSearch(),
          SizedBox(
            height: 20,
          ),
          HomeBanner(),
          SizedBox(
            height: 20,
          ),
          HomeCategories(),
          SizedBox(
            height: 20,
          ),
          HomeRecipes()
        ]),
      ),
    );
  }
}
