import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/functions/navigate_to_tab.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_rich_text.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/search_section.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/specialists_widget.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/top_rated_section.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRichText(
              text: 'مرحبا، ',
              textStyle: AppStyles.textBold18,
              linkText: FirebaseAuth.instance.currentUser?.displayName ?? '',
            ),
            HeightBox(12),
            Text(
              "احجز الآن وكن جزءًا من رحلتك الصحية.",
              style: AppStyles.textBold26,
            ),
            HeightBox(24),
            SearchSection(
              readOnly: true,
              onTap: () => navigateToTab(context, 1),
              notDisplaySuffix: false,
            ),
            HeightBox(24),
            SpecialistsBanner(),
            HeightBox(24),
            TopRatedSection(),
            HeightBox(24),
          ],
        ),
      ),
    );
  }
}
