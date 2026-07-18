import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/you_may_like_section.dart';
import 'package:flutter/material.dart';

class BookDetialsViewBody extends StatelessWidget {
  const BookDetialsViewBody({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  title: book.title,
                  image: book.image ?? '',
                  author: book.autherName ?? 'No Author Name',
                ),
                const Expanded(child: SizedBox(height: 5)),
                const YouMayLikeSection(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
