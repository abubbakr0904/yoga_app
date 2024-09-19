import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoga_app/screens/tab_box/settings_screen/settings_screen.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class GlobalAppbar extends StatelessWidget {
  const GlobalAppbar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.manropeSemiBold.copyWith(
            fontSize: 28.sp,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          child: Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
                color: AppColors.cF5F5F5,
                borderRadius: BorderRadius.circular(16.r)),
            child: Center(
              child: SvgPicture.asset(
                AppImages.settings,
                width: 24.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
