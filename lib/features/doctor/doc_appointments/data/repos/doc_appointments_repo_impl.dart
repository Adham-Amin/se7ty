import 'package:dartz/dartz.dart';
import 'package:se7ty/features/doctor/doc_appointments/data/data_sources/doc_appointments_data_source.dart';
import 'package:se7ty/features/doctor/doc_appointments/data/repos/doc_appointments_repo.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

class DocAppointmentsRepoImpl implements DocAppointmentsRepo {
  final DocAppointmentsDataSource docAppointmentsDataSource;
  DocAppointmentsRepoImpl({required this.docAppointmentsDataSource});

  @override
  Future<Either<String, List<AppointmentModel>>> getDocAppointments() async {
    try {
      var appointments = await docAppointmentsDataSource.getDocAppointments();
      return Right(appointments);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<AppointmentModel>>> acceptAppointment({
    required String appointmentId,
  }) async {
    try {
      await docAppointmentsDataSource.acceptAppointment(
        appointmentId: appointmentId,
      );
      var appointments = await docAppointmentsDataSource.getDocAppointments();
      return Right(appointments);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<AppointmentModel>>> deleteAppointment({
    required String appointmentId,
  }) async {
    try {
      await docAppointmentsDataSource.deleteAppointment(
        appointmentId: appointmentId,
      );
      var appointments = await docAppointmentsDataSource.getDocAppointments();
      return Right(appointments);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
