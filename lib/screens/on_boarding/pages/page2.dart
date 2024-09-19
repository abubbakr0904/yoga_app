import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({super.key});

  @override
  State<Page2Screen> createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Stack(
        children: [
          Image.asset(
            AppImages.onBoardingPage2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.only(
              top: 50.h
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Create your own Yoga workouts",
                  style: AppTextStyle.manropeSemiBold
                      .copyWith(color: Colors.white, fontSize: 28.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Choose the difficulty, the number of workouts per week and set up notifications",
                  style: AppTextStyle.manropeSemiBold
                      .copyWith(color: Colors.white, fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 150.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
