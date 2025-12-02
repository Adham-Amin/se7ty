import 'dart:convert';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUser(PatientModel patient) async {
    await _prefs?.setString('user', jsonEncode(patient.toJson()));
  }

  static PatientModel? getUser() {
    final user = _prefs?.getString('user');
    return user != null ? PatientModel.fromJson(jsonDecode(user)) : null;
  }

  static Future<void> setDoctor(DoctorModel doctor) async {
    await _prefs?.setString('admin', jsonEncode(doctor.toJson()));
  }

  static DoctorModel? getDoctor() {
    final user = _prefs?.getString('admin');
    return user != null ? DoctorModel.fromJson(jsonDecode(user)) : null;
  }

  static Future<void> clearUserData() async {
    await _prefs?.remove('user');
    await _prefs?.remove('admin');
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }
}
