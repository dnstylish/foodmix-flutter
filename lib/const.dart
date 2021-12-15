import 'package:flutter/material.dart';

final TextStyle kTextContent =  TextStyle(color: Colors.black.withOpacity(0.7), height: 1.3);

const TextStyle kTextH4 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
const TextStyle kTextH5 = TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
const Color kPrimary = Color(0xFF6366f1);

const SliverGridDelegateWithFixedCrossAxisCount kGridRecipesLayout = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 1,
  childAspectRatio: 15 / 8,
  mainAxisSpacing: 25,
  crossAxisSpacing: 16,
);