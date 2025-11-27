import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/data/model/specializations.dart';

class SpecialitySection extends StatelessWidget {
  const SpecialitySection({super.key, required this.speciality, this.value});
  final String? value;
  final Function(String?) speciality;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('التخصص', style: AppStyles.textRegular16),
        SizedBox(height: 12.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String?>(
            isExpanded: true,
            iconEnabledColor: AppColors.primary,
            underline: const SizedBox(),
            hint: Text('اختر التخصص', style: AppStyles.textRegular16),
            icon: const Icon(Icons.expand_circle_down_outlined),
            value: value,
            onChanged: speciality,
            items: [
              for (var specialization in specializations)
                DropdownMenuItem(
                  value: specialization,
                  child: Text(specialization, style: AppStyles.textRegular16),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
