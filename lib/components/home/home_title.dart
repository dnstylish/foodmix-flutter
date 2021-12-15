import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Text(
                'Hello, Yuan  👋🏻',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6366f1)
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Bạn muốn nấu gì hôm này?',
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),

          TextButton(
              onPressed: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: 'https://api.foodmix.xyz/images/users/61b4641e53050d21cbe36a15/avatar/25d977ca-2601-4213-b667-c932041342d1.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )
              )
          )
        ],
      ),
    );
  }
}
