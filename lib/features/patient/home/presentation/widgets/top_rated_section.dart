import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الأعلي تقييماً",
          textAlign: TextAlign.center,
          style: AppStyles.textBold18,
        ),
        HeightBox(12),
        ListView.separated(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => HeightBox(12),
          itemBuilder: (context, index) => DoctorCard(
            doctor: DoctorModel(
              name: 'ادهم امين',
              image: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              specialization: 'اطفال',
              rating: 4,
            ),
          ),
        ),
      ],
    );
  }
}
