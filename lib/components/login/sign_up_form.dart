import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/auth_view_model.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

import '../../const.dart';


class SignUpFormView extends ViewModelWidget<AuthViewModel> {
  const SignUpFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Column(
      children: [

        ClipRRect(
          borderRadius: kPrimaryRadius,
          child: TextField(
              cursorColor: Colors.grey,
              onChanged: (String text) => viewModel.name = text,
              style: TextStyle(
                // fontWeight: FontWeight.w500
                  color: Colors.black.withOpacity(0.8)
              ),
              decoration: kPrimaryInput.copyWith(
                  hintText: 'User Name',
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
              onChanged: (String text) => viewModel.email = text,
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
              obscureText: !viewModel.isShowPass,
              enableSuggestions: false,
              autocorrect: false,
              cursorColor: Colors.grey,
              onChanged: (String text) => viewModel.password = text,
              style: TextStyle(
                // fontWeight: FontWeight.w500
                  color: Colors.black.withOpacity(0.8)
              ),
              decoration: kPrimaryInput.copyWith(
                  hintText: viewModel.isShowPass ? 'password' : '********',
                  prefixIcon: Icon(Ionicons.lock_closed_outline, color: Colors.black.withOpacity(0.5)),
                  suffixIcon: GestureDetector(
                    onTap: () => viewModel.toggleShowPass(),
                    child: Icon(viewModel.isShowPass ? Ionicons.eye_off_outline : Ionicons.eye_outline, color: Colors.black.withOpacity(0.5)),
                  )
              )
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('Quên mật khẩu?', style: TextStyle(color: kPrimary)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AnimatedOpacity(
            opacity: viewModel.isLoading ? 0.5 : 1,
            duration: const Duration(milliseconds: 300),
            child: TextButton(
                onPressed: () => viewModel.signUp(context),
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
                      child: Text('Đăng Ký'.toUpperCase(),
                          style: const TextStyle(color: Colors.white, fontSize: 14)
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

