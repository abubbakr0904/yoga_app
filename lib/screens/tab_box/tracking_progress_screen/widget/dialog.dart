import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/tab_box/tab_box.dart';
import 'package:yoga_app/screens/tab_box/work_out_plan_screen/work_out_plan_screen.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Image.asset(AppImages.frog, width: 120.w, fit: BoxFit.cover),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Congratulations!",
              style: AppTextStyle.manropeSemiBold
                  .copyWith(color: Colors.black, fontSize: 20.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "You have completed all the workouts,\n keep it up",
              style: AppTextStyle.manropeSemiBold.copyWith(
                  color: Colors.black.withOpacity(0.6), fontSize: 10.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkOutPlanScreen(
                              onTap: () {},
                            )));
              },
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 34.w),
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                      color: AppColors.appMainColor,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Center(
                    child: Text(
                      "New plan",
                      style: AppTextStyle.manropeSemiBold
                          .copyWith(color: Colors.white, fontSize: 14.sp),
                    ),
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const TabBox()),
                    (route) => false);
              },
              child: Text(
                "Go home",
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: AppColors.appMainColor, fontSize: 14.sp),
              ),
            ),
          ],
        ),
      );
    },
  );
}
