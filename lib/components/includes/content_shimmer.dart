import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContentShimmer extends StatelessWidget {
  const ContentShimmer({Key? key, required this.child }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: child
    );
  }
}
