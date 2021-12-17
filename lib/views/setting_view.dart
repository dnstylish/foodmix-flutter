import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/components/settings/user_center.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:foodmix/views/login_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => PrefViewModel(),
        builder: (context, viewModel, child) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey.withOpacity(0.1),
            appBar: AppBar(
                elevation: 0,
                centerTitle: false,
                title: Text('Cài Đặt', style: kTextH3.copyWith(color: Colors.black.withOpacity(0.8))),
                backgroundColor: Colors.white,
                actions: [
                  IconButton(icon: Icon(Icons.more_vert, color: Colors.black.withOpacity(0.8)), onPressed: () {})
                ]
            ),
            body: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    UserCenter(),

                    SizedBox(
                      height: 20,
                    ),

                    _SettingItem(label: 'Thư Viện', icon: Ionicons.bookmarks_outline),

                    _SettingItem(label: 'Lịch Sử', icon: Ionicons.alarm_outline),

                    _SettingItem(label: 'Mật Khẩu', icon: Ionicons.finger_print_outline),

                    _SettingItem(label: 'Thoả Thuận Người Dùng', icon: Ionicons.shield_checkmark_outline),

                    _SettingItem(label: 'Báo cáo Sự Số', icon: Ionicons.help_buoy_outline),

                    _SettingItem(label: 'Thông Tin Phiên Bản', icon: Ionicons.information_circle_outline),

                    _SettingAuthButton(),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

class _SettingAuthButton extends ViewModelWidget<PrefViewModel> {
  const _SettingAuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: TextButton(
          onPressed: () => viewModel.toggleAuth(context),
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero
          ),
          child: ClipRRect(
            borderRadius: kPrimaryRadius,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              color: viewModel.auth ? Colors.deepOrangeAccent : kPrimary,
              child: Center(
                child: Text((viewModel.auth ? 'Đăng Xuất' : 'Đăng Nhập').toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontSize: 14)
                ),
              ),
            ),
          )),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({Key? key, required this.label, required this.icon}) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(label, style: kTextH5.copyWith(fontWeight: FontWeight.normal))
              ),
              const Icon(Ionicons.chevron_forward_outline)
            ],
          ),
        ),
        const SizedBox(
          height: 13,
        )
      ],
    );
  }
}

