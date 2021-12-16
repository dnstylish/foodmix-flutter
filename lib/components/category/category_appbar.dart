import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/components/includes/content_shimmer.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/viewModels/category_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoryAppBar extends ViewModelWidget<CategoryViewModel> {
  const CategoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      expandedHeight: 250,
      centerTitle: false,
      elevation: 0,
      backgroundColor: kPrimary.withOpacity(viewModel.showPress),
      title: Opacity(
        opacity: viewModel.showPress,
        child: Text('${viewModel.category?.name}'),
      ),
      leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop()
      ),
      actions: [
        IconButton(icon: const Icon(Icons.share), onPressed: () {})
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: viewModel.isReady ? const _CategoryOverLay() : const _CategoryOverlayPlaceholder(),
                )
            ),

            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.only(left: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 50 - 20 - 140 - 10,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: viewModel.isReady ? _CategoryTitle(title: viewModel.category?.name ?? '', count: viewModel.count) : const _CategoryTitlePlaceholder(),
                        ),
                      ),
                    ),
                  ),
                )
            ),

            Positioned(
                bottom: 30,
                right: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(130),
                    border: Border.all(color: Colors.white, width: 5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(130),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: viewModel.isReady
                          ? CachedNetworkImage(
                              imageUrl: viewModel.$cdn(viewModel.category?.avatar ?? ''),
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover
                          )
                          : ContentShimmer(
                              child: Container(
                                color: Colors.grey,
                                width: 130,
                                height: 130,
                              )
                            )
                    ),
                  ),
                )
            ),

            const Positioned(
              bottom: 0,
                left: 20,
                right: 20,
                child: Divider()
            )

          ],
        ),
      ),
    );
  }
}

class _CategoryTitle extends StatelessWidget {
  const _CategoryTitle({ Key? key, required this.title, required this.count }) : super(key: key);

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: kTextH3),
        const SizedBox(height: 3),
        Text(
            count > 0 ? 'Hiện có $count món ăn' : 'Hiện không có món ăn',
            style: kTextContent.copyWith( color: Colors.black.withOpacity(0.6) )
        )
      ],
    );
  }
}
class _CategoryTitlePlaceholder extends StatelessWidget {
  const _CategoryTitlePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentShimmer(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: kPrimaryRadius
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 14,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: kPrimaryRadius
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _CategoryOverLay extends ViewModelWidget<CategoryViewModel> {
  const _CategoryOverLay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(
              viewModel.$cdn(viewModel.category?.avatar ?? '')
            ),
            fit: BoxFit.cover
        )
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
      ),
    );
  }
}
class _CategoryOverlayPlaceholder extends StatelessWidget {
  const _CategoryOverlayPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentShimmer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
      ),
    );
  }
}

