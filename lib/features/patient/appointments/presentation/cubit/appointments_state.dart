part of 'appointments_cubit.dart';

sealed class AppointmentsState {}

final class AppointmentsInitial extends AppointmentsState {}

final class AppointmentsLoading extends AppointmentsState {}

final class AppointmentsLoaded extends AppointmentsState {
  final List<AppointmentModel> appointments;
  AppointmentsLoaded({required this.appointments});
}

final class AppointmentsError extends AppointmentsState {
  final String message;
  AppointmentsError({required this.message});
}
