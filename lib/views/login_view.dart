import 'package:flutter/material.dart';
import 'package:foodmix/components/login/google_login_button.dart';
import 'package:foodmix/components/login/login_form.dart';
import 'package:foodmix/services/network_service.dart';
import 'package:foodmix/viewModels/auth_view_model.dart';
import 'package:stacked/stacked.dart';

import '../service_locator.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<NetworkService>().context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (ctx, viewModel, child) => Scaffold(
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
                      const Text('Đăng Nhập', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 25,
                      ),
                      const LoginFormView(),

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

                      const GoogleLoginButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
