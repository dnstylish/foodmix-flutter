import 'package:flutter/material.dart';
import 'package:foodmix/components/settings/user_center.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingView extends ViewModelWidget<PrefViewModel> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {
    return const CustomScrollView(
      slivers: [

        UserCenter()

      ],
    );
  }
}

