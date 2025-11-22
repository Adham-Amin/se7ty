part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final UserEntity user;
  AuthLoaded({required this.user});
}

final class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}

final class AuthForgetPasswordLoading extends AuthState {}

final class AuthForgetPasswordLoaded extends AuthState {}

final class AuthForgetPasswordError extends AuthState {
  final String message;
  AuthForgetPasswordError({required this.message});
}
