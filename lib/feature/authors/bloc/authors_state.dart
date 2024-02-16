import 'package:equatable/equatable.dart';

import '../../../exports.dart';

abstract class AuthorsState extends Equatable {
  const AuthorsState();
  @override
  List<Object> get props => [];
}

final class AuthorsInitial extends AuthorsState {
  const AuthorsInitial();
}

final class AuthorsLoading extends AuthorsState {
  const AuthorsLoading();
}

final class AuthorsLoaded extends AuthorsState {
  final Authors response;
  const AuthorsLoaded(this.response);
  @override
  List<Object> get props => [response];
}

final class AuthorsError extends AuthorsState {
  final String message;

  const AuthorsError(this.message);
}
