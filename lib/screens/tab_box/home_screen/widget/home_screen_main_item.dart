import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class HomeScreenMainItem extends StatelessWidget {
  const HomeScreenMainItem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
      EdgeInsets.only(bottom: 16.w, left: 16.w, right: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: AppColors.appMainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Workout plan",
                style: AppTextStyle.manropeBold.copyWith(
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                "0/0 completed",
                style: AppTextStyle.manropeRegular.copyWith(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: 36.w, vertical: 11.w)),
                onPressed: onTap,
                child: Text(
                  "Unlock",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.appMainColor,
                  ),
                ),
              )
            ],
          ),
          Image.asset(
            AppImages.homeScreenGirl,
            width: 103.w,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
