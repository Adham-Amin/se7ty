import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';

String executeToNavigator() {
  final user = Prefs.getUser();
  return user != null ? AppRoutes.mainView : AppRoutes.welcomeView;
}
