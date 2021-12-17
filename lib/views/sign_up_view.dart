import 'package:flutter/material.dart';
import 'package:foodmix/components/login/login_form.dart';
import 'package:foodmix/components/login/sign_up_form.dart';

import '../const.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)),
              onPressed: () => Navigator.of(context).pop()
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/cooking1.jpg', height: 200)),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Đăng Ký', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 25,
                  ),
                  const SignUpFormView(),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('TIẾP TỤC VỚI',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                  ),

                  const _GoogleLogin(),

                  const SizedBox(height: 30)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GoogleLogin extends StatelessWidget {
  const _GoogleLogin({
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
