import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/widget/global_appbar.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 43.h,
                ),
                const GlobalAppbar(text: "Statistics"),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  AppImages.statisticsImage,
                  width: 164.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Unlock access to statistics",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.w),
                    margin: EdgeInsets.symmetric(horizontal: 67.w),
                    decoration: BoxDecoration(
                        color: AppColors.appMainColor,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Text(
                      "Continue",
                      style: AppTextStyle.manropeSemiBold.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
