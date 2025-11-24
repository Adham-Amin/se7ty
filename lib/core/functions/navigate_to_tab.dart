import 'package:flutter/material.dart';
import 'package:se7ty/features/patient/main/nav_bar.dart';

void navigateToTab(BuildContext context, int index) {
  PatientMainView.mainViewKey.currentState?.changeTab(index);
  FocusManager.instance.primaryFocus?.unfocus();
}
