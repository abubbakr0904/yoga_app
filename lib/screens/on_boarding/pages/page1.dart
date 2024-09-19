import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class Page1Screen extends StatefulWidget {
  const Page1Screen({super.key});

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.onBoardingPage1,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Explore some popular asanas",
                  style: AppTextStyle.manropeSemiBold
                      .copyWith(color: Colors.white, fontSize: 28.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Study the detailed instructions for performing asanas so that everything works out",
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
