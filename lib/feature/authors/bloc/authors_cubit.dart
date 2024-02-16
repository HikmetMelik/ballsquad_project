import 'package:ballsquad_project/feature/authors/repo/authors_repo.dart';
import 'package:ballsquad_project/feature/authors/bloc/authors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsCubit extends Cubit<AuthorsState> {
  final AuthorsRepo _authorsRepo;
  AuthorsCubit(this._authorsRepo) : super(const AuthorsInitial());

  Future<void> getAuthors(String? fieldData) async {
    try {
      emit(const AuthorsLoading());
      await Future.delayed(const Duration(milliseconds: 300));
      final response = await _authorsRepo.getAuthors(fieldData ?? "");
      emit(AuthorsLoaded(response));
    } on NetworkError {
      emit(const AuthorsError('Failed to fetch authors'));
    }
  }
}
