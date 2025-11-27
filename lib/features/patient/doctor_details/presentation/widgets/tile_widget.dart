import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 27,
            width: 27,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Icon(icon, color: Colors.white, size: 16),
          ),
          WidthBox(12),
          Expanded(
            child: Text(
              text,
              style: AppStyles.textRegular16.copyWith(color: AppColors.dark),
            ),
          ),
        ],
      ),
    );
  }
}
