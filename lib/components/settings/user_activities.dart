import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/pref_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../const.dart';

class UserActivities extends ViewModelWidget<PrefViewModel> {
  const UserActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PrefViewModel viewModel) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hoạt động', style: kTextH5),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text('1234', style: kTextH5.copyWith(color: Colors.white)),
                  ),
                ),
              )
          ),
        )
      ],
    );
  }
}
