import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
                color: AppColors.cF5F5F5,
                borderRadius: BorderRadius.circular(24.r)),
            child: Column(
              children: [
                Text(
                  "Average number of workouts per week",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "2",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                      color: AppColors.appMainColor, fontSize: 28.sp),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child:SizedBox(),
        ),
        Expanded(
          flex: 15,
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
                color: AppColors.cF5F5F5,
                borderRadius: BorderRadius.circular(24.r)),
            child: Column(
              children: [
                Text(
                  "Average number of workouts per week",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "8",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                      color: AppColors.appMainColor, fontSize: 28.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
