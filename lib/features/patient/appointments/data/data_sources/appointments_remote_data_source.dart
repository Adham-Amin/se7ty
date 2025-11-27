import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class AppointmentsRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments();
  Future<void> deleteAppointment({required String appointmentId});
}

class AppointmentsRemoteDataSourceImpl implements AppointmentsRemoteDataSource {
  final FirebaseService firebaseService;
  AppointmentsRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<void> deleteAppointment({required String appointmentId}) async {
    await firebaseService.firestore
        .collection('appointments')
        .doc(appointmentId)
        .delete();
  }

  @override
  Future<List<AppointmentModel>> getAppointments() async {
    final user = firebaseService.auth.currentUser!;
    var snapshot = await firebaseService.firestore
        .collection('appointments')
        .orderBy('date')
        .where('patientID', isEqualTo: user.uid)
        .get();

    List<AppointmentModel> appointments = [];
    for (var doc in snapshot.docs) {
      appointments.add(AppointmentModel.fromJson(doc.data(), doc.id));
    }

    return appointments;
  }
}
