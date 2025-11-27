import 'package:dartz/dartz.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/booking/data/data_source/booking_remote_data_source.dart';

abstract class BookingRepo {
  Future<Either<String, void>> bookAppointment({
    required AppointmentModel appointment,
  });
}

class BookingRepoImpl implements BookingRepo {
  final BookingRemoteDataSource bookingRemoteDataSource;
  BookingRepoImpl({required this.bookingRemoteDataSource});

  @override
  Future<Either<String, void>> bookAppointment({
    required AppointmentModel appointment,
  }) async {
    try {
      await bookingRemoteDataSource.bookAppointment(appointment: appointment);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
