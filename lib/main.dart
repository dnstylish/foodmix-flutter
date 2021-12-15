import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:foodmix/views/main_view.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(const FoodMix());
}

class FoodMix extends StatelessWidget {
  const FoodMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrefViewModel>.reactive(
      viewModelBuilder: () => PrefViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => MaterialApp(
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.grey)
        ),
        home: const MainView(),
      ),
    );
  }
}

