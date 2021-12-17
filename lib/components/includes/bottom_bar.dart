import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:ionicons/ionicons.dart';
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: viewModel.tabSelected == 0 ? const Icon(Ionicons.compass) : const Icon(Ionicons.compass_outline),
            ),
            label: 'Khám Phá',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: viewModel.tabSelected == 1 ? const Icon(Ionicons.search) : const Icon(Ionicons.search_outline),
            ),
            label: 'Tìm Kiếm',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: viewModel.tabSelected == 2 ? const Icon(Ionicons.bookmark) : const Icon(Ionicons.bookmark_outline),
            ),
            label: 'Thư Viện',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: viewModel.tabSelected == 3 ? const Icon(Ionicons.settings) : const Icon(Ionicons.settings_outline),
            ),
            label: 'Cài Đặt',
          )
        ]);
  }
}
