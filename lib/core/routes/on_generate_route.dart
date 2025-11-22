import 'package:flutter/material.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/features/auth/presentation/views/login_view.dart';
import 'package:se7ty/features/auth/presentation/views/register_view.dart';
import 'package:se7ty/features/intro/onbording/presentation/views/onbording_view.dart';
import 'package:se7ty/features/intro/splash/presentation/views/splash_view.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';
import 'package:se7ty/features/intro/welcome/presentation/views/welcome_view.dart';
import 'package:se7ty/features/main/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case AppRoutes.onbordingView:
      return MaterialPageRoute(builder: (_) => const OnbordingView());
    case AppRoutes.welcomeView:
      return MaterialPageRoute(builder: (_) => const WelcomeView());
    case AppRoutes.loginView:
      return MaterialPageRoute(
        builder: (_) => LoginView(userType: settings.arguments as UserTypeEnum),
      );
    case AppRoutes.registerView:
      return MaterialPageRoute(
        builder: (_) =>
            RegisterView(userType: settings.arguments as UserTypeEnum),
      );
    case AppRoutes.mainView:
      return MaterialPageRoute(builder: (_) => const MainView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
