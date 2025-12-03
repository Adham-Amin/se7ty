import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/doctor/doc_appointments/data/repos/doc_appointments_repo.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

part 'doc_appointments_state.dart';

class DocAppointmentsCubit extends Cubit<DocAppointmentsState> {
  DocAppointmentsCubit({required this.docAppointmentsRepo})
    : super(DocAppointmentsInitial());

  final DocAppointmentsRepo docAppointmentsRepo;

  Future<void> getDocAppointments() async {
    emit(DocAppointmentsLoading());
    var result = await docAppointmentsRepo.getDocAppointments();
    result.fold(
      (l) => emit(DocAppointmentsError(message: l)),
      (r) => emit(DocAppointmentsLoaded(appointments: r)),
    );
  }

  Future<void> acceptAppointment({required String appointmentId}) async {
    emit(DocAppointmentsLoading());
    var result = await docAppointmentsRepo.acceptAppointment(
      appointmentId: appointmentId,
    );
    result.fold(
      (l) => emit(DocAppointmentsError(message: l)),
      (r) => emit(DocAppointmentsLoaded(appointments: r)),
    );
  }

  Future<void> deleteAppointment({required String appointmentId}) async {
    emit(DocAppointmentsLoading());
    var result = await docAppointmentsRepo.deleteAppointment(
      appointmentId: appointmentId,
    );
    result.fold(
      (l) => emit(DocAppointmentsError(message: l)),
      (r) => emit(DocAppointmentsLoaded(appointments: r)),
    );
  }
}
