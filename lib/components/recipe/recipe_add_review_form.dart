import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/primary_button.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/viewModels/add_review_view_model.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

class AddReviewForm extends StatelessWidget {
  const AddReviewForm({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddReviewViewMode>.reactive(
        viewModelBuilder: () => AddReviewViewMode(recipe: recipe),
        builder: (ctx, viewModel, child) => Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: kBottomSheetRadius
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  const Text('Đánh Giá', style: kTextH4),

                  const Divider(height: 30),

                  const _FormRatingStar(),

                  const Divider(height: 30),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                        cursorColor: Colors.grey,
                        onChanged: (String? text) => viewModel.setContent(text ?? ''),
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          height: 1.4
                        ),
                        decoration: kPrimaryInput.copyWith(
                            hintText: 'Nhận xét của bạn là điều rất tuyệt với các tác giả. Hãy nhận xét có tâm và lớn hơn 50 ký tự bạn nhé...',
                            contentPadding: const EdgeInsets.all(20)
                        ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  AnimatedOpacity(
                      opacity: viewModel.canSubmit ? 1 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: PrimaryButton(callback: () => viewModel.submit(), icon: null, label: 'Đăng Đánh Giá', vertical: 15),
                  )
                ],
              ),
            )
        )
    );
  }
}

class _FormRatingStar extends ViewModelWidget<AddReviewViewMode> {
  const _FormRatingStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddReviewViewMode viewMode) {
    return Column(
      children: [
        ...viewMode.points.asMap().map(
                (key, value) => MapEntry(key,
                    _RatingStarItem(
                        ratingPoint: value,
                        onClick: (int point) => viewMode.setPoint(index: key, point: point)
                    )
                )
        ).values.toList(),

        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.black.withOpacity(0.05),
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Icon(Ionicons.flash_outline, color: Colors.grey),
                const SizedBox(width: 16),
                const Expanded(child: Text('Tổng điểm...', style: TextStyle(color: Colors.grey))),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(
                    children: [
                      Text(viewMode.rating.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 5),
                      const Icon(Ionicons.star, color: Colors.white, size: 16)
                    ],
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        )

      ],
    );
  }
}

class _RatingStarItem extends StatelessWidget {
  const _RatingStarItem({ Key? key, required this.ratingPoint, required this.onClick }) : super(key: key);

  final RatingPoint ratingPoint;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(ratingPoint.content),
          Expanded(child: Container()),
          Row(
              children: List.generate(5, (i) =>
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        iconSize: 18,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => onClick(i),
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: ratingPoint.rating >= i + 1 ? const Icon(Ionicons.star, color: kPrimary) :  const Icon(Ionicons.star_outline, color: kPrimary),
                        )
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}

