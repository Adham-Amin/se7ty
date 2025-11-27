import 'package:flutter/material.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/auth/presentation/views/doctor_registeration_view.dart';
import 'package:se7ty/features/auth/presentation/views/login_view.dart';
import 'package:se7ty/features/auth/presentation/views/register_view.dart';
import 'package:se7ty/features/intro/onbording/presentation/views/onbording_view.dart';
import 'package:se7ty/features/intro/splash/presentation/views/splash_view.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';
import 'package:se7ty/features/intro/welcome/presentation/views/welcome_view.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/views/doctor_details_view.dart';
import 'package:se7ty/features/patient/home/presentation/page/speciality_view.dart';
import 'package:se7ty/features/patient/main/nav_bar.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case AppRoutes.onbordingView:
      return MaterialPageRoute(builder: (_) => const OnbordingView());
    case AppRoutes.welcomeView:
      return MaterialPageRoute(builder: (_) => const WelcomeView());
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (_) => LoginView());
    case AppRoutes.registerView:
      return MaterialPageRoute(
        builder: (_) =>
            RegisterView(userType: settings.arguments as UserTypeEnum),
      );
    case AppRoutes.doctorRegisterView:
      return MaterialPageRoute(builder: (_) => const DoctorRegisterView());
    case AppRoutes.patientMainView:
      return MaterialPageRoute(
        builder: (_) => PatientMainView(key: PatientMainView.mainViewKey),
      );
    case AppRoutes.specialityView:
      return MaterialPageRoute(
        builder: (_) =>
            SpecialityView(specialityName: settings.arguments as String),
      );
    case AppRoutes.doctorDetailsView:
      return MaterialPageRoute(
        builder: (_) =>
            DoctorDetailsView(doctor: settings.arguments as DoctorModel),
      );
    case AppRoutes.bookingView:
      return MaterialPageRoute(
        builder: (_) =>
            DoctorDetailsView(doctor: settings.arguments as DoctorModel),
      );
    default:
      return MaterialPageRoute(builder: (_) => const WelcomeView());
  }
}
