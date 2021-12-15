import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeSearch extends ViewModelWidget<PrefViewModel> {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(40),
          right: Radius.circular(40)
      ),
      child: InkWell(
        onTap: () => viewModel.changeTab(1),
        child: Container(
          height: 40,
          width: double.infinity,
          color: Colors.black.withOpacity(0.05),
          child: Row(
            children: const [
              SizedBox(width: 16),
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 16),
              Text('Tìm kiếm...', style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
