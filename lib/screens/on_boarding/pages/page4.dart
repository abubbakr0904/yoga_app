import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/on_boarding/pages/widget/page4_item.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class Page4Screen extends StatefulWidget {
  const Page4Screen({super.key});

  @override
  State<Page4Screen> createState() => _Page4ScreenState();
}

class _Page4ScreenState extends State<Page4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Stack(
        children: [
          Image.asset(
            AppImages.onBoardingPage4,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.only(top: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 25 , horizontal: 20.w),
                  padding : EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color : Colors.white.withOpacity(0.1),
                    border: Border.all(
                      width: 1,
                      color : Colors.white
                    )
                  ),
                  child : Column(
                    children: [
                      const Page4Item(text: "Get your workout statistics"),
                      SizedBox(height : 8.h),
                      const Page4Item(text: "Create your own workouts"),
                      SizedBox(height : 8.h),
                      const Page4Item(text: "Access to all asanas"),
                    ],
                  )
                ),
                Text(
                  "Get full access to  the app",
                  style: AppTextStyle.manropeSemiBold
                      .copyWith(color: Colors.white, fontSize: 28.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Unlock all the features in just \$0.99",
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
