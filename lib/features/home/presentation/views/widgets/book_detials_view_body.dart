import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomBookDetailsAppBar()]);
  }
}
