import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class Page3Screen extends StatefulWidget {
  const Page3Screen({super.key});

  @override
  State<Page3Screen> createState() => _Page3ScreenState();
}

class _Page3ScreenState extends State<Page3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Stack(
        children: [
          Image.asset(
            AppImages.onBoardingPage3,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
                  "Keep track of your progress",
                  style: AppTextStyle.manropeSemiBold
                      .copyWith(color: Colors.white, fontSize: 28.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Keep track of your workout progress to make your sessions even more effective",
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
