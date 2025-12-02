import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/custom_text_form_field_password.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';

Future<void> openEditDialog({
  required String title,
  required String initialValue,
  required ValueChanged<String> onSave,
  TextInputType keyboardType = TextInputType.text,
  required BuildContext context,
  int maxLines = 1,
}) async {
  final controller = TextEditingController(text: initialValue);
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppStyles.textBold18.copyWith(color: AppColors.primary),
              ),
              HeightBox(16),
              TextField(
                style: AppStyles.textRegular16.copyWith(color: AppColors.black),
                controller: controller,
                keyboardType: keyboardType,
                maxLines: maxLines,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(20),
              CustomButton(
                title: 'حفظ',
                onTap: () {
                  onSave(controller.text);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> editPasswordDialog({
  required BuildContext context,
  required TextEditingController newPasswordController,
  required TextEditingController oldPasswordController,
  required GlobalKey<FormState> formKey,
  required VoidCallback onTap,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'تغيير كلمة المرور',
                  style: AppStyles.textBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                HeightBox(16),
                CustomTextFormFieldPassword(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل كلمة المرور الحالية';
                    }
                    return null;
                  },
                  hintText: 'ادخل كلمة المرور الحالية',
                  controller: oldPasswordController,
                ),
                HeightBox(16),
                CustomTextFormFieldPassword(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ادخل كلمة المرور الجديدة';
                    }
                    return null;
                  },
                  hintText: 'ادخل كلمة المرور الجديدة',
                  controller: newPasswordController,
                ),
                HeightBox(20),
                CustomButton(title: 'حفظ', onTap: onTap),
              ],
            ),
          ),
        ),
      );
    },
  );
}
