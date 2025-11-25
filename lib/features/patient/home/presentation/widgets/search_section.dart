import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    this.readOnly,
    this.onTap,
    this.onChange,
    this.notDisplaySuffix = true,
  });

  final bool? readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChange;
  final bool notDisplaySuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: .3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: CustomTextFormField(
        onTap: onTap,
        onChanged: onChange,
        readOnly: readOnly ?? false,
        hintText: notDisplaySuffix ? 'ادخل الاسم' : 'ابحث عن دكتور',
        suffixIcon: notDisplaySuffix
            ? null
            : Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  iconSize: 20,
                  splashRadius: 20,
                  color: Colors.white,
                  icon: const Icon(Icons.search),
                  onPressed: null,
                ),
              ),
      ),
    );
  }
}
