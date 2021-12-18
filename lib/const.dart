import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final TextStyle kTextContent =  TextStyle(color: Colors.black.withOpacity(0.7), height: 1.3);

const TextStyle kTextH3 = TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
const TextStyle kTextH4 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
const TextStyle kTextH5 = TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
const Color kPrimary = Color(0xFF6366f1);

final InputDecoration kPrimaryInput = InputDecoration(
    contentPadding: const EdgeInsets.only(top: 15),
    filled: true,
    fillColor: Colors.black.withOpacity(0.05),
    border: InputBorder.none,

);

const SliverGridDelegateWithFixedCrossAxisCount kGridRecipesLayout = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 1,
  childAspectRatio: 15 / 8,
  mainAxisSpacing: 25,
  crossAxisSpacing: 16,
);

final BorderRadius kPrimaryRadius = BorderRadius.circular(10);
const BorderRadius kBottomSheetRadius = BorderRadius.only(
  topLeft: Radius.circular(15),
  topRight: Radius.circular(15)
);

class Notify {
  static CustomSnackBar success(String msg) => CustomSnackBar.success(
      message: msg,
      icon: const Icon(Icons.add, color: Colors.transparent),
      backgroundColor: kPrimary,
  );
}