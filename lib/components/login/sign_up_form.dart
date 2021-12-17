import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/services/auth_service.dart';
import 'package:ionicons/ionicons.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../const.dart';
import '../../service_locator.dart';

class SignUpFormView extends StatefulWidget {
  const SignUpFormView({Key? key}) : super(key: key);

  @override
  _SignUpFormViewState createState() => _SignUpFormViewState();

}

class _SignUpFormViewState extends State<SignUpFormView> {

  bool isShowPass = false;
  String _email = '';
  String _name = '';
  String _password = '';
  bool isLoading = false;

  Future<void> _signUp() async {

    if([_email, _password, _name].contains('') || isLoading) {
      // form trống
      return;
    }

    setState(() {
      isLoading = true;
    });

    if (kDebugMode) {
      print('Login with: { email: $_email, password: $_password }');
    }

    try {

      AuthService viewModel = locator<AuthService>();
      await viewModel.login(password: _password, email: _email);

      if(viewModel.$auth) {
        // đăng nhập thành công
        showTopSnackBar(context, Notify.success('Đăng ký thành công'));
        Navigator.of(context).pop();
      }

    } catch (_) {}

    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: kPrimaryRadius,
          child: TextField(
              cursorColor: Colors.grey,
              onChanged: (String text) => _name = text,
              style: TextStyle(
                // fontWeight: FontWeight.w500
                  color: Colors.black.withOpacity(0.8)
              ),
              decoration: kPrimaryInput.copyWith(
                  hintText: 'Tên Người Dùng',
                  prefixIcon: Icon(Ionicons.person_outline, color: Colors.black.withOpacity(0.5))
              )
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        ClipRRect(
          borderRadius: kPrimaryRadius,
          child: TextField(
              cursorColor: Colors.grey,
              onChanged: (String text) => _email = text,
              style: TextStyle(
                // fontWeight: FontWeight.w500
                  color: Colors.black.withOpacity(0.8)
              ),
              decoration: kPrimaryInput.copyWith(
                  hintText: 'Email ID',
                  prefixIcon: Icon(Ionicons.at_outline, color: Colors.black.withOpacity(0.5))
              )
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        ClipRRect(
          borderRadius: kPrimaryRadius,
          child: TextField(
              obscureText: !isShowPass,
              enableSuggestions: false,
              autocorrect: false,
              cursorColor: Colors.grey,
              onChanged: (String text) => _password = text,
              style: TextStyle(
                // fontWeight: FontWeight.w500
                  color: Colors.black.withOpacity(0.8)
              ),
              decoration: kPrimaryInput.copyWith(
                  hintText: isShowPass ? 'password' : '********',
                  prefixIcon: Icon(Ionicons.lock_closed_outline, color: Colors.black.withOpacity(0.5)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowPass = !isShowPass;
                      });
                    },
                    child: Icon(isShowPass ? Ionicons.eye_off_outline : Ionicons.eye_outline, color: Colors.black.withOpacity(0.5)),
                  )
              )
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('Đã có tài khoản?', style: TextStyle(color: kPrimary)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AnimatedOpacity(
            opacity: isLoading ? 0.5 : 1,
            duration: const Duration(milliseconds: 300),
            child: TextButton(
                onPressed: () => _signUp(),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                ),
                child: ClipRRect(
                  borderRadius: kPrimaryRadius,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    color: kPrimary,
                    child: Center(
                      child: Text('Đăng Nhập'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

