part of 'doc_change_pass_cubit.dart';

sealed class DocChangePassState {}

final class DocChangePassInitial extends DocChangePassState {}

final class DocChangePassLoading extends DocChangePassState {}

final class DocChangePassLoaded extends DocChangePassState {}

final class DocChangePassError extends DocChangePassState {
  final String message;
  DocChangePassError({required this.message});
}
