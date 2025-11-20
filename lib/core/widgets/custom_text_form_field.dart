import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:se7ty/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.inputFormatters,
    this.prefixIcon,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextAlign textAlign;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      style: AppStyles.textRegular14,
      textAlign: textAlign,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(hintText: hintText, prefixIcon: prefixIcon),
    );
  }
}
