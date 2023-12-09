part of 'auth_bloc.dart';

enum AuthType {
  login,
  register,
}

enum AuthStatus {
  waiting,
  authorized,
  unauthorized,
}

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial({this.authType = AuthType.login});

  final AuthType? authType;

  @override
  List<Object?> get props => [authType];
}

final class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object?> get props => [];
}

final class AuthSuccess extends AuthState {
  const AuthSuccess({required this.userModel});

  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

final class AuthFailure extends AuthState {
  const AuthFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
