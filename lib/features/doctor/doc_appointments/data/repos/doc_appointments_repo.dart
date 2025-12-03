import 'package:dartz/dartz.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class DocAppointmentsRepo {
  Future<Either<String, List<AppointmentModel>>> getDocAppointments();
  Future<Either<String, List<AppointmentModel>>> acceptAppointment({
    required String appointmentId,
  });
  Future<Either<String, List<AppointmentModel>>> deleteAppointment({
    required String appointmentId,
  });
}
