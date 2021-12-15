import 'package:flutter/material.dart';
import 'package:foodmix/viewModels/search_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchInputView extends ViewModelWidget<SearchViewModel> {
  const SearchInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(40)
      ),
      child: TextField(
          cursorColor: Colors.grey,
          onChanged: (String text) => viewModel.keyword = text,
          onSubmitted: (String text) => viewModel.submitSearch(),
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              // prefixIconColor: Colors.grey,
              hintText: 'Nhập từ khoá...'
          )
      ),
    );
  }
}
