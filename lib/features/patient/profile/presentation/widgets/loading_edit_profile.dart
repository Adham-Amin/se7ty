import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/edit_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingEditProfile extends StatelessWidget {
  const LoadingEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          HeightBox(24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const EditItem(title: 'الاسم', value: '---', onTap: null),
                  HeightBox(16),
                  const EditItem(
                    title: 'رقم الهاتف',
                    value: '---',
                    onTap: null,
                  ),
                  HeightBox(16),
                  const EditItem(title: 'المدينة', value: '---', onTap: null),
                  HeightBox(16),
                  const EditItem(
                    title: 'نبذة تعريفية',
                    value: '---',
                    onTap: null,
                  ),
                  HeightBox(16),
                  const EditItem(title: 'العمر', value: '---', onTap: null),
                  HeightBox(16),
                  const EditItem(title: 'العمر', value: '---', onTap: null),
                ],
              ),
            ),
          ),
          CustomButton(
            title: 'تسجيل الخروج',
            onTap: () {},
            colortext: AppColors.white,
            backgroundColor: Colors.red,
          ),
          HeightBox(32),
        ],
      ),
    );
  }
}
