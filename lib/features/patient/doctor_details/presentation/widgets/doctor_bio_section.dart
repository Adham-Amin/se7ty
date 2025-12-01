import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key, required this.bio});

  final String bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("نبذه تعريفية", style: AppStyles.textBold16),
        HeightBox(12),
        Text(bio, style: AppStyles.textRegular16),
      ],
    );
  }
}
