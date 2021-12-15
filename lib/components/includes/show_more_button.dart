import 'package:flutter/material.dart';
import 'package:foodmix/const.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({Key? key, this.label = 'Xem Thêm', required this.callback }) : super(key: key);
  final String label;
  final VoidCallback callback;


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          callback();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: kPrimary,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 14)),
                const Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
          ),
        )
    );
  }
}
