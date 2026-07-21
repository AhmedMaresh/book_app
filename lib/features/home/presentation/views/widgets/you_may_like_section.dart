import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/you_may_like_list_view.dart';
import 'package:flutter/material.dart';

class YouMayLikeSection extends StatelessWidget {
  const YouMayLikeSection({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('You may also like', style: Styles.textStyle16),
        const SizedBox(height: 10),
        YouMayLikeListView(books: books),
      ],
    );
  }
}
