part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final PatientModel patient;
  ProfileLoaded({required this.patient});
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}

final class ProfileChangePassword extends ProfileState {}
