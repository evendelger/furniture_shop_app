import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(const AuthInitial(authType: AuthType.login)) {
    on<ChangeAuthType>(_changeType);
    on<LogIn>(_login);
    on<Register>(_authRegister);
    on<LogInAnonymously>(_logInAnonymously);
  }

  final AbstractAuthRepository authRepository;

  void _changeType(ChangeAuthType event, Emitter<AuthState> emit) {
    if (state is AuthInitial) {
      final newAuthType = (state as AuthInitial).authType == AuthType.login
          ? AuthType.register
          : AuthType.login;
      emit(AuthInitial(authType: newAuthType));
    }
  }

  Future<void> _login(LogIn event, Emitter<AuthState> emit) async {
    final authType = (state as AuthInitial).authType;
    emit(const AuthLoading());

    try {
      final userModel = UserModel(
        email: event.email,
        password: event.password,
      );
      await authRepository.signIn(userModel);
      await Future.delayed(const Duration(seconds: 3));

      final loggedInUser = await authRepository.getUserStream().first;
      emit(AuthSuccess(userModel: loggedInUser));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
      emit(AuthInitial(authType: authType));
    }
  }

  Future<void> _authRegister(
    Register event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final userModel = UserModel(
        displayName: event.name,
        email: event.email,
        password: event.password,
      );

      final userCredential = await authRepository.signUp(userModel);
      await Future.delayed(const Duration(seconds: 3));

      final registeredModel = UserModel.fromUserCredential(userCredential);
      emit(AuthSuccess(userModel: registeredModel));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _logInAnonymously(
    LogInAnonymously event,
    Emitter<AuthState> emit,
  ) async {
    final authType = (state as AuthInitial).authType;
    emit(const AuthLoading());
    try {
      final userCredential = await authRepository.signInAnonymously();
      final userModel = UserModel.fromUserCredential(userCredential)
          .copyWith(displayName: 'anon');
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthSuccess(userModel: userModel));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
      emit(AuthInitial(authType: authType));
    }
  }
}
