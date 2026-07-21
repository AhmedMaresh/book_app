import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/save_books_locally.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> searchBook({required String bookName});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
      endPoint:
          'volumes?key=${apiServices.apiKey}&q=flutter&filtering=free-ebooks&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);

    saveBooksLocally(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
      endPoint: 'volumes?key=${apiServices.apiKey}&q=programming',
    );

    List<BookEntity> newestBooks = getBooksList(data);

    saveBooksLocally(newestBooks, kNewestBox);

    return newestBooks;
  }

  @override
  Future<List<BookEntity>> searchBook({required String bookName}) async {
    var data = await apiServices.get(
      endPoint: 'volumes?key=${apiServices.apiKey}&q=intitle:$bookName',
    );

    List<BookEntity> searchedBook = getBooksList(data);

    return searchedBook;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    if (data['items'] != null) {
      for (var bookMap in data['items']) {
        books.add(BookModel.fromJson(bookMap));
      }
    }
    return books;
  }
}
