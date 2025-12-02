part of 'doc_profile_cubit.dart';

sealed class DocProfileState {}

final class DocProfileInitial extends DocProfileState {}

final class DocProfileLoading extends DocProfileState {}

final class DocProfileLoaded extends DocProfileState {
  final DoctorModel doctor;
  DocProfileLoaded({required this.doctor});
}

final class DocProfileError extends DocProfileState {
  final String message;
  DocProfileError({required this.message});
}

final class DocProfileAppointments extends DocProfileState {
  final List<AppointmentModel> appointments;
  DocProfileAppointments({required this.appointments});
}

final class DocProfileChangePassword extends DocProfileState {}
