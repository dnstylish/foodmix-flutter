import 'package:flutter/material.dart';

import '../../const.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kPrimaryRadius,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.05),
                  child: Center(
                    child: Text('Đăng Nhập Với Google'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w500)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/google.png',
                    width: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}