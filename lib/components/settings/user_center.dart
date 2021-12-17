import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/const.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

class UserCenter extends ViewModelWidget<PrefViewModel> {
  const UserCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {

    return Container(
      color: Colors.white,
      height: 150,
      child: Row(
        children: [
          SizedBox(
            width: 160,
            height: double.infinity,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Colors.white, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: CachedNetworkImage(
                    imageUrl: viewModel.userAvatar,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.currentUser?.name ?? '----', style: kTextH3),
                const SizedBox(height: 2),
                Text('Thành Viên', style: kTextContent)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.pencil_outline, color: Colors.grey)
            ),
          )
        ],
      ),
    );
  }
}

