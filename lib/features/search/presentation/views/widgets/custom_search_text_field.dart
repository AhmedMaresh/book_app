import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kAlternativeColor,
      decoration: InputDecoration(
        hint: const Text('Search'),
        suffixIcon: IconButton(
          onPressed: () {},
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
