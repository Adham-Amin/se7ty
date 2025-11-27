import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    super.key,
    required this.icon,
    required this.backColor,
    required this.num,
    this.onTap,
  });

  final IconData icon;
  final Color backColor;
  final VoidCallback? onTap;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20, color: AppColors.dark),
                WidthBox(4),
                Text(
                  num,
                  style: AppStyles.textRegular16.copyWith(
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
