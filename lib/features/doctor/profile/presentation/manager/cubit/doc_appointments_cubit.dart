import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/doctor/profile/data/repo/doc_profile_repo.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
part 'doc_appointments_state.dart';

class DocAppointmentsCubit extends Cubit<DocAppointmentsState> {
  DocAppointmentsCubit({required this.docProfileRepo})
    : super(DocAppointmentsInitial());

  final DocProfileRepo docProfileRepo;

  Future<void> getAppointments() async {
    emit(DocAppointmentsLoading());
    final result = await docProfileRepo.getAppointments();
    result.fold(
      (l) => emit(DocAppointmentsError(message: l)),
      (r) => emit(DocAppointmentsLoaded(appointments: r)),
    );
  }
}
