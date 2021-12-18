import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/loading_view.dart';
import 'package:foodmix/components/includes/primary_button.dart';
import 'package:foodmix/models/review.dart';
import 'package:foodmix/viewModels/recipe_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../const.dart';
import 'add_review_button.dart';

class RecipeReviews extends ViewModelWidget<RecipeViewModel> {
  const RecipeReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RecipeViewModel viewModel) {
    return VisibilityDetector(
      key: const Key('reviews'),
      onVisibilityChanged: (VisibilityInfo info) {
        viewModel.setCurrentView(info, 2);
        viewModel.getReviewFirst();
      },
      child: Column(
        key: viewModel.reviewsKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Đánh Giá(${viewModel.recipe?.countRating})', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          const AddReviewButton(),
          const SizedBox(height: 20),
          Column(
            children:
                viewModel.reviews.map((e) => _ReviewItem(review: e)).toList(),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.isNoMoreReviews
                ? const Center(
                    child: LoadingView(title: 'Mọi thứ tới đây thôi...'))
                : viewModel.isGettingReview
                    ? const Center(
                        child: LoadingView(),
                      )
                    : PrimaryButton(callback: () => viewModel.getReviews()),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem({Key? key, required this.review}) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.05),
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CachedNetworkImage(
                      imageUrl: review.cdn(review.user.avatar),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review.user.name, style: kTextH5),
                      const SizedBox(height: 5),
                      _StarRating(rating: review.rating ?? 0),
                      const SizedBox(height: 5),
                      Text(review.content, style: kTextContent),
                      const SizedBox(height: 10),
                      Text('15/12/2021',
                          style: kTextContent.copyWith(fontSize: 12))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}

class _StarRating extends StatelessWidget {
  const _StarRating({Key? key, required this.rating}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Icon(Icons.star,
                    size: 14,
                    color:
                        kPrimary.withOpacity((index + 1) <= rating ? 1 : 0.5)),
              )),
    );
  }
}
