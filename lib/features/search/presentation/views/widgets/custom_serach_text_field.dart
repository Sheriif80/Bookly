import 'dart:async';

import 'package:bookly/features/search/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        if (_debounce?.isActive ?? false) {
          _debounce!.cancel();
        }
        _debounce = Timer(const Duration(milliseconds: 1000), () {
          BlocProvider.of<SearchCubit>(context).getSearchResults(value);
        });
      },
      onSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context).getSearchResults(value);
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            if (searchController.text.isNotEmpty) {
              BlocProvider.of<SearchCubit>(
                context,
              ).getSearchResults(searchController.text);
            }
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 25,
            color: Colors.white,
          ),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search for books or authors',
      ),
    );
  }
}
