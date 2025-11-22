import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';

class WorkHoursSection extends StatelessWidget {
  final TextEditingController openHourController;
  final TextEditingController closeHourController;

  const WorkHoursSection({
    super.key,
    required this.openHourController,
    required this.closeHourController,
  });

  Future<void> _pickTime(
    TextEditingController controller,
    BuildContext context,
  ) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) controller.text = "${time.hour}:${time.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('ساعات العمل من', style: AppStyles.textRegular16),
            ),
            Expanded(child: Text('الي', style: AppStyles.textRegular16)),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                readOnly: true,
                controller: openHourController,
                onTap: () => _pickTime(openHourController, context),
                hintText: '00:00',
                suffixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.primary,
                ),
                validator: (value) => value!.isEmpty ? 'مطلوب' : null,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: CustomTextFormField(
                readOnly: true,
                controller: closeHourController,
                onTap: () => _pickTime(closeHourController, context),
                hintText: '00:00',
                suffixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.primary,
                ),
                validator: (value) => value!.isEmpty ? 'مطلوب' : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
