import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/home/data/models/specialization_card_model.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/specialist_card.dart';

class SpecialistsBanner extends StatelessWidget {
  const SpecialistsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("التخصصات", style: AppStyles.textBold18),
        HeightBox(12),
        SizedBox(
          height: 230,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: SpecializationCardModel.specializationsCard.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: SpecialistCard(
                  model: SpecializationCardModel.specializationsCard[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
