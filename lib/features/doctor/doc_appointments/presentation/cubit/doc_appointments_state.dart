part of 'doc_appointments_cubit.dart';

sealed class DocAppointmentsState {}

final class DocAppointmentsInitial extends DocAppointmentsState {}

final class DocAppointmentsLoading extends DocAppointmentsState {}

final class DocAppointmentsLoaded extends DocAppointmentsState {
  final List<AppointmentModel> appointments;
  DocAppointmentsLoaded({required this.appointments});
}

final class DocAppointmentsError extends DocAppointmentsState {
  final String message;
  DocAppointmentsError({required this.message});
}
