part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class ChangeAuthType extends AuthEvent {
  const ChangeAuthType();
}

final class LogIn extends AuthEvent {
  const LogIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

final class LogInAnonymously extends AuthEvent {
  const LogInAnonymously();
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
