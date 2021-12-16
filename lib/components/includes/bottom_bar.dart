import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:stacked/stacked.dart';

class BottomBarView extends ViewModelWidget<PrefViewModel> {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.tabSelected,
        selectedItemColor: const Color(0xFF6366f1),
        onTap: (tab) => viewModel.changeTab(tab),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Khám Phá',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tìm Kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Thư Viện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài Đặt',
          ),
        ]);
  }
}
