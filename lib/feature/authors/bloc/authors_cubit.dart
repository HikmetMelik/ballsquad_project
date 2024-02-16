import '../../../exports.dart';

final class AuthorsCubit extends Cubit<AuthorsState> {
  final AuthorsRepo _authorsRepo;
  AuthorsCubit(this._authorsRepo) : super(const AuthorsInitial());

  Future<void> getAuthors(String? fieldData) async {
    try {
      emit(const AuthorsLoading());
      await Future.delayed(const Duration(milliseconds: 100));
      final response = await _authorsRepo.getAuthors(fieldData ?? "");
      emit(AuthorsLoaded(response));
    } on NetworkError catch (e) {
      emit(AuthorsError(e.message));
    }
  }
}
