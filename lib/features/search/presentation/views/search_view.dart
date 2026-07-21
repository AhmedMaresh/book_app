import 'package:bookly/core/utils/functions/setup_service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/use_cases/search_book_use_case.dart';
import 'package:bookly/features/home/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBookCubit(SearchBookUseCase(getIt.get<HomeRepoImpl>())),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(body: SafeArea(child: SearchViewBody())),
      ),
    );
  }
}
