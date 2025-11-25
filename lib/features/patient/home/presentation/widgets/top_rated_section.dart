import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/empty_doctors.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/core/widgets/loading_doctor.dart';
import 'package:se7ty/features/patient/home/presentation/cubit/home_cubit.dart';

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
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              if (state.doctors.isEmpty) {
                return EmptyDoctors(message: 'القسم');
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: state.doctors.length,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => HeightBox(12),
                itemBuilder: (context, index) =>
                    DoctorCard(doctor: state.doctors[index]),
              );
            } else {
              return LoadingDoctors();
            }
          },
        ),
      ],
    );
  }
}
