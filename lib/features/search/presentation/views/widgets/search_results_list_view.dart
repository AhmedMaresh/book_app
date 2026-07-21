import 'package:bookly/features/home/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchBookFailure) {
          return Center(child: Text(state.errMessage));
        }

        if (state is SearchBookSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookListViewItem(
                book: state.books[index],
                books: state.books,
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
