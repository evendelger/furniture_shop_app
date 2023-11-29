part of 'auth_bloc.dart';

enum AuthType {
  login,
  register,
}

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial({required this.authType});

  final AuthType authType;

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
  const AuthFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
