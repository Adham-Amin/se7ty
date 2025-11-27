import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/booking/presentation/widgets/custom_input_label.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.descriptionController,
    required this.dateController,
    required this.onDateTap,
    required this.times,
    required this.selectedHour,
    required this.onHourSelected,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  final VoidCallback onDateTap;
  final List<int> times;
  final int selectedHour;
  final Function(int) onHourSelected;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('-- ادخل بيانات الحجز --', style: AppStyles.textBold18),
          ),
          HeightBox(16),
          CustomInputLabel(text: 'اسم المريض'),
          HeightBox(8),
          CustomTextFormField(
            hintText: 'ادخل اسم المريض',
            controller: nameController,
            validator: (v) => v!.isEmpty ? 'من فضلك ادخل اسم المريض' : null,
          ),
          HeightBox(16),
          CustomInputLabel(text: 'رقم الهاتف'),
          HeightBox(8),
          CustomTextFormField(
            hintText: 'ادخل رقم الهاتف',
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (v) {
              if (v!.isEmpty) return 'من فضلك ادخل رقم الهاتف';
              if (v.length < 10) return 'يرجي ادخال رقم هاتف صحيح';
              return null;
            },
          ),
          HeightBox(16),
          CustomInputLabel(text: 'وصف الحاله'),
          HeightBox(8),
          CustomTextFormField(
            hintText: 'ادخل وصف الحاله',
            controller: descriptionController,
            validator: (v) => v!.isEmpty ? 'من فضلك ادخل وصف الحاله' : null,
            maxLines: 5,
          ),
          HeightBox(16),
          CustomInputLabel(text: 'تاريخ الحجز'),
          HeightBox(8),
          CustomTextFormField(
            hintText: 'ادخل تاريخ الحجز',
            controller: dateController,
            readOnly: true,
            onTap: onDateTap,
            validator: (v) => v!.isEmpty ? 'من فضلك ادخل تاريخ الحجز' : null,
            suffixIcon: const Icon(Icons.date_range_outlined),
          ),
          HeightBox(24),
          if (times.isNotEmpty) ...[
            CustomInputLabel(text: 'وقت الحجز'),
            HeightBox(8),
            Wrap(
              spacing: 8,
              children: [
                for (var hour in times)
                  ChoiceChip(
                    label: Text('${hour.toString().padLeft(2, '0')}:00'),
                    selected: hour == selectedHour,
                    onSelected: (_) => onHourSelected(hour),
                    backgroundColor: AppColors.accent,
                    labelStyle: AppStyles.textRegular16.copyWith(
                      color: Colors.black,
                    ),
                    checkmarkColor: AppColors.white,
                    selectedColor: AppColors.primary,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
