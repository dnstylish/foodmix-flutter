import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/bottom_bar.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:foodmix/views/home_view.dart';
import 'package:foodmix/views/search_view.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrefViewModel>.reactive(
      viewModelBuilder: () => PrefViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: IndexedStack(
              children: [
                const HomeView(),
                const SearchView(),
                Container(),
                Container()
              ],
              index: viewModel.tabSelected,
            ),
          ),
        ),
        bottomNavigationBar: const BottomBarView(),
      ),
    );
  }
}
