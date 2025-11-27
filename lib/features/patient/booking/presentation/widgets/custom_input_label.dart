import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';

class CustomInputLabel extends StatelessWidget {
  const CustomInputLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyles.textRegular16);
  }
}
