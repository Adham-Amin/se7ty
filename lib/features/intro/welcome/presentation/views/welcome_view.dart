import 'package:flutter/material.dart';
import 'package:se7ty/features/intro/welcome/presentation/widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WelcomeViewBody());
  }
}
