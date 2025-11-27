import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class AppointmentsRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments();
  Future<void> deleteAppointment();
}

class AppointmentsRemoteDataSourceImpl implements AppointmentsRemoteDataSource {
  final FirebaseService firebaseService;
  AppointmentsRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<void> deleteAppointment() async {
    final user = firebaseService.auth.currentUser!;
    await firebaseService.firestore
        .collection('appointments')
        .doc(user.uid)
        .delete();
  }

  @override
  Future<List<AppointmentModel>> getAppointments() async {
    final user = firebaseService.auth.currentUser!;
    var snapshot = await firebaseService.firestore
        .collection('appointments')
        .orderBy('date')
        .where('patientId', isEqualTo: user.uid)
        .get();

    List<AppointmentModel> appointments = [];
    for (var doc in snapshot.docs) {
      appointments.add(AppointmentModel.fromJson(doc.data()));
    }

    return appointments;
  }
}
