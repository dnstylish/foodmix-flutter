import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/search_view_model.dart';
import 'package:searchfield/searchfield.dart';
import 'package:stacked/stacked.dart';

class SearchSelectCategory extends ViewModelWidget<SearchViewModel> {
  const SearchSelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(40)),
      child: SearchField(
        hint: 'Phân loại món ăn',
        searchInputDecoration: const InputDecoration(
            prefixIcon: Icon(Icons.restaurant_menu, color: Colors.grey),
            border: InputBorder.none),
        suggestions: viewModel.categories.map((e) => e.name).toList(),
        onTap: (x) => viewModel.selectCategory(x as String)
      ),
    );
  }
}
