import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../const.dart';

class AddReviewButton extends ViewModelWidget<RecipeViewModel> {
  const AddReviewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.openReviewModal(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black.withOpacity(0.05),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Icon(Icons.alternate_email, color: Colors.grey),
              const SizedBox(width: 16),
              const Expanded(child: Text('Đánh giá...', style: TextStyle(color: Colors.grey))),
              Container(
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: Row(
                  children: [
                    Text('Gửi'.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 5),
                    const Icon(Icons.send, color: Colors.white, size: 16)
                  ],
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}