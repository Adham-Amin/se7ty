import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class BookingRemoteDataSource {
  Future<void> bookAppointment({required AppointmentModel appointment});
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final FirebaseService firebaseService;
  BookingRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<void> bookAppointment({required AppointmentModel appointment}) async {
    await firebaseService.firestore
        .collection('appointments')
        .doc()
        .set(appointment.toJson());
  }
}
