import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: CachedNetworkImage(
        imageUrl: 'https://api.foodmix.xyz/images/users/61b4641e53050d21cbe36a15/recipe/8d1ef6c6-60cb-4ba4-bf60-be8fe27a6d15.jpg',
        height: 180,
        width: double.infinity,
      ),
    );
  }
}
