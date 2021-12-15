import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

class RecipeOverlay extends ViewModelWidget<RecipeViewModel> {
  const RecipeOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(
            imageUrl: viewModel.recipe.cdn(viewModel.recipe.avatar),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover
        )
        ),
        Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3)
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CachedNetworkImage(
                              imageUrl: 'https://api.foodmix.xyz/images/users/61b4641e53050d21cbe36a15/avatar/25d977ca-2601-4213-b667-c932041342d1.jpg',
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Đăng bởi', style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 3),
                                Text('Trường Thọ', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Opacity(
                          opacity: 0.7,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white, width: 2)
                            ),
                            child: const Icon(Icons.chevron_right, color: Colors.white, size: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            )
        )
      ],
    );
  }
}
