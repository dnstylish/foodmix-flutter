import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/models/user.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipeTabBar extends ViewModelWidget<RecipeViewModel> {
  const RecipeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return AnimatedOpacity(
      opacity: viewModel.showPress,
      duration: const Duration(milliseconds: 300),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _TabButtonItem(
              label: 'Thông Tin',
              onClick: () => viewModel.scrollTo(viewModel.infoKey),
              inView: viewModel.currentView.name == 'info',
          ),
          _TabButtonItem(
              label: 'Cách Làm',
              onClick: () => viewModel.scrollTo(viewModel.stepperKey),
              inView: viewModel.currentView.name == 'stepper',
          ),
          _TabButtonItem(
              label: 'Đánh Giá',
              onClick: () => viewModel.scrollTo(viewModel.reviewsKey),
              inView: viewModel.currentView.name == 'reviews',
          )
        ],
      ),
    );
  }
}

class _TabButtonItem extends StatelessWidget {
  const _TabButtonItem({Key? key, required this.label, required this.onClick, required this.inView}) : super(key: key);

  final String label;
  final VoidCallback onClick;
  final bool inView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          TextButton(
              onPressed: onClick,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5
                  )
              ),
              child: Text(label, style: const TextStyle(color: Colors.white))
          ),

          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: inView ? 1 : 0,
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.white,
                ),
              )
          )

        ],
      ),
    );
  }
}

