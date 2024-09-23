import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/utils/images/app_images.dart';

import '../../../../utils/colors/app_colors.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
            color: AppColors.cF5F5F5,
            borderRadius: BorderRadius.circular(16.r)),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
