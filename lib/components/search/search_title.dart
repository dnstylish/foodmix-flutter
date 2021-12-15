import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
          'Tìm Kiếm',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          )
      ),
    );
  }
}
