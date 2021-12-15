import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key, this.title = 'Đang tải...' }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
            'assets/lottie/loading.json',
            width: 200
        ),

        const SizedBox(
          height: 20
        ),

        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey ))

      ],
    );
  }
}
