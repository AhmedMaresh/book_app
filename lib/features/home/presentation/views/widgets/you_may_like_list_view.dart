import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book_item.dart';
import 'package:flutter/material.dart';

class YouMayLikeListView extends StatelessWidget {
  const YouMayLikeListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return FeaturedBookItem(image: books[index].image ?? '');
        },
      ),
    );
  }
}
