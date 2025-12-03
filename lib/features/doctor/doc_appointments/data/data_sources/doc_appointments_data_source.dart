import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class DocAppointmentsDataSource {
  Future<List<AppointmentModel>> getDocAppointments();
  Future<void> acceptAppointment({required String appointmentId});
  Future<void> deleteAppointment({required String appointmentId});
}

class DocAppointmentsDataSourceImpl extends DocAppointmentsDataSource {
  final FirebaseService firebaseService;
  DocAppointmentsDataSourceImpl({required this.firebaseService});

  @override
  Future<List<AppointmentModel>> getDocAppointments() async {
    var snapshot = await firebaseService.firestore
        .collection('appointments')
        .where('doctorID', isEqualTo: firebaseService.auth.currentUser!.uid)
        .get();

    List<AppointmentModel> appointments = [];
    for (var doc in snapshot.docs) {
      appointments.add(AppointmentModel.fromJson(doc.data(), doc.id));
    }

    return appointments;
  }

  @override
  Future<void> acceptAppointment({required String appointmentId}) async {
    await firebaseService.firestore
        .collection('appointments')
        .doc(appointmentId)
        .update({'isComplete': true});
  }

  @override
  Future<void> deleteAppointment({required String appointmentId}) {
    return firebaseService.firestore
        .collection('appointments')
        .doc(appointmentId)
        .delete();
  }
}
