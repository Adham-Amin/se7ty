import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/appointments/data/repo/appointments_repo.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit({required this.appointmentsRepo})
    : super(AppointmentsInitial());

  final AppointmentsRepo appointmentsRepo;

  Future<void> getAppointments() async {
    emit(AppointmentsLoading());
    final result = await appointmentsRepo.getAppointments();
    result.fold(
      (error) => emit(AppointmentsError(message: error)),
      (appointments) => emit(AppointmentsLoaded(appointments: appointments)),
    );
  }

  Future<void> deleteAppointment() async {
    emit(AppointmentsLoading());
    final result = await appointmentsRepo.deleteAppointment();
    result.fold((error) => emit(AppointmentsError(message: error)), (_) async {
      await getAppointments();
    });
  }
}
