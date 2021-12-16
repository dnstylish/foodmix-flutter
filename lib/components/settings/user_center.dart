import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:stacked/stacked.dart';

class UserCenter extends ViewModelWidget<PrefViewModel> {
  const UserCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {
    return const SliverAppBar();
  }
}
