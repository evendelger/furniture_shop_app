import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthLoading()) {
    on<AuthChangeType>(_changeType);
    on<AuthLogIn>(_login);
    on<Register>(_authRegister);
    on<AuthLogInAnonymously>(_logInAnonymously);
    on<AuthFetchStatus>(_fetchStatus);
    on<AuthLogOut>(_logout);

    // FetchStatus при инициализации блока(приложения)
    add(const AuthFetchStatus());
  }

  final IAuthRepository _authRepository;

  Future<void> _fetchStatus(
    AuthFetchStatus event,
    Emitter<AuthState> emit,
  ) async {
    final user = _authRepository.getCurrentUser;
    if (user.isAuthorized) {
      emit(AuthSuccess(userModel: user));
    } else {
      emit(const AuthInitial());
    }
  }

  void _changeType(AuthChangeType event, Emitter<AuthState> emit) {
    if (state is AuthInitial) {
      final newAuthType = (state as AuthInitial).authType == AuthType.login
          ? AuthType.register
          : AuthType.login;
      emit(AuthInitial(authType: newAuthType));
    }
  }

  Future<void> _login(AuthLogIn event, Emitter<AuthState> emit) async {
    final authType = (state as AuthInitial).authType;
    emit(const AuthLoading());

    try {
      final userLogInModel = UserLogInModel(
        email: event.email,
        password: event.password,
      );
      await _authRepository.signIn(userLogInModel: userLogInModel);
      final loggedInUser = _authRepository.getCurrentUser;
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
      final userRegModel = UserRegisterModel(
        displayName: event.name,
        email: event.email,
        password: event.password,
      );

      final userCredential = await _authRepository.signUp(
        userRegModel: userRegModel,
      );
      await Future.delayed(const Duration(seconds: 3));

      final registeredModel = UserModel.fromUserCredential(userCredential);
      emit(AuthSuccess(userModel: registeredModel));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _logInAnonymously(
    AuthLogInAnonymously event,
    Emitter<AuthState> emit,
  ) async {
    final authType = (state as AuthInitial).authType;
    emit(const AuthLoading());
    try {
      final userCredential = await _authRepository.signInAnonymously();
      final userModel = UserModel.fromUserCredential(userCredential)
          .copyWith(displayName: 'anon');
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthSuccess(userModel: userModel));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
      emit(AuthInitial(authType: authType));
    }
  }

  Future<void> _logout(
    AuthLogOut event,
    Emitter<AuthState> emit,
  ) async {
    final stateBeforeLogOut = state;
    try {
      await _authRepository.signOut();
      emit(const AuthInitial());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
      emit(stateBeforeLogOut);
    }
  }
}
