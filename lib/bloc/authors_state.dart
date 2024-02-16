import 'package:ballsquad_project/bloc/authors.dart';

abstract class AuthorsState {
  const AuthorsState();
}

class AuthorsInitial extends AuthorsState {
  const AuthorsInitial();
}

class AuthorsLoading extends AuthorsState {
  const AuthorsLoading();
}

class AuthorsLoaded extends AuthorsState {
  final List<Authors> response;

  const AuthorsLoaded(this.response);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthorsLoaded && o.response == response;
  }

  @override
  int get hashCode => response.hashCode;
}

class AuthorsError extends AuthorsState {
  final String message;

  const AuthorsError(this.message);
}
