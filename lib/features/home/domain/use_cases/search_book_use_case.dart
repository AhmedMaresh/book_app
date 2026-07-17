import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBookUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  SearchBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    if (param == null) {
      return left(ServerFailure('Book name is required!!!'));
    }
    return await homeRepo.searchBook(param);
  }
}
