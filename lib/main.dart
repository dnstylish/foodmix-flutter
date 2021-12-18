import 'package:flutter/material.dart';
import 'package:foodmix/service_locator.dart';
import 'package:foodmix/views/main_view.dart';
import 'package:foodmix/views/recipe_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const FoodMix());
}

class FoodMix extends StatelessWidget {
  const FoodMix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.grey)
      ),
      home: const MainView(),
    );
  }
}

