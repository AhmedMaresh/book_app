import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: kAlternativeColor,
      decoration: InputDecoration(
        hint: const Text('Search'),
        suffixIcon: IconButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              context.read<SearchBookCubit>().searchBook(controller.text);
            }
          },
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
        ),
        ////////////////////////////////////////////////////////////
        enabledBorder: buildOutlineInputBorder(color: Colors.white),
        ////////////////////////////////////////////////////////////
        focusedBorder: buildOutlineInputBorder(color: kAlternativeColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color),
    );
  }
}
