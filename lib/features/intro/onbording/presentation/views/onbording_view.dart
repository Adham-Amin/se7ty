import 'package:flutter/material.dart';
import 'package:se7ty/features/intro/onbording/presentation/widgets/onbording_view_body.dart';

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnbordingViewBody()));
  }
}
