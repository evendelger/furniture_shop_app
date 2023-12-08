part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthFetchStatus extends AuthEvent {
  const AuthFetchStatus();
}

final class AuthChangeType extends AuthEvent {
  const AuthChangeType();
}

final class AuthLogOut extends AuthEvent {
  const AuthLogOut();
}

final class AuthLogIn extends AuthEvent {
  const AuthLogIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

final class AuthLogInAnonymously extends AuthEvent {
  const AuthLogInAnonymously();
}

final class Register extends AuthEvent {
  const Register({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object> get props => [name, email, password];
}

// TODO
// final class ResetPassword extends AuthEvent {
//   const AuthResetPassword();
// }
