import 'package:dartz/dartz.dart';
import 'package:se7ty/features/patient/appointments/data/data_sources/appointments_remote_data_source.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class AppointmentsRepo {
  Future<Either<String, List<AppointmentModel>>> getAppointments();
  Future<Either<String, void>> deleteAppointment({
    required String appointmentId,
  });
}

class AppointmentsRepoImpl implements AppointmentsRepo {
  final AppointmentsRemoteDataSource appointmentsRemoteDataSource;
  AppointmentsRepoImpl({required this.appointmentsRemoteDataSource});

  @override
  Future<Either<String, List<AppointmentModel>>> getAppointments() async {
    try {
      final appointments = await appointmentsRemoteDataSource.getAppointments();
      return right(appointments);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteAppointment({
    required String appointmentId,
  }) async {
    try {
      await appointmentsRemoteDataSource.deleteAppointment(
        appointmentId: appointmentId,
      );
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
