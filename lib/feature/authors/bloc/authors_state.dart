import 'package:ballsquad_project/feature/authors/model/authors.dart';
import 'package:equatable/equatable.dart';

abstract class AuthorsState extends Equatable {
  const AuthorsState();
  @override
  List<Object> get props => [];
}

class AuthorsInitial extends AuthorsState {
  const AuthorsInitial();
}

class AuthorsLoading extends AuthorsState {
  const AuthorsLoading();
}

class AuthorsLoaded extends AuthorsState {
  final Authors response;
  const AuthorsLoaded(this.response);
  @override
  List<Object> get props => [response];
}

class AuthorsError extends AuthorsState {
  final String message;

  const AuthorsError(this.message);
}
