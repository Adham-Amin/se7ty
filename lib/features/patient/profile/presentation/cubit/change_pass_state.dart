part of 'change_pass_cubit.dart';

sealed class ChangePassState {}

final class ChangePassInitial extends ChangePassState {}

final class ChangePassLoading extends ChangePassState {}

final class ChangePassLoaded extends ChangePassState {}

final class ChangePassError extends ChangePassState {
  final String message;
  ChangePassError({required this.message});
}
