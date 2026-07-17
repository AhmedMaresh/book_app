import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/search_book_use_case.dart';
import 'package:meta/meta.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchBookUseCase) : super(SearchBookInitial());

  final SearchBookUseCase searchBookUseCase;

  Future<void> searchBook(String bookName) async {
    emit(SearchBookLoading());

    var result = await searchBookUseCase.call(bookName);

    result.fold(
      (failure) {
        emit(SearchBookFailure(failure.message));
      },
      (book) {
        emit(SearchBookSuccess(book));
      },
    );
  }
}
