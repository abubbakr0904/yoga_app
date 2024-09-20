import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
            color : AppColors.cF5F5F5,
            borderRadius: BorderRadius.circular(24.r)
        ),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppImages.tick , width: 24.w, fit : BoxFit.cover),
                Text(
                  "Sunday",
                  style: AppTextStyle.manropeSemiBold
                      .copyWith(color: Colors.black, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Text(
              "To start your workout, click on the button",
              style: AppTextStyle.manropeSemiBold
                  .copyWith(color: Colors.black.withOpacity(0.6), fontSize: 12.sp),
            ),
            SizedBox(height: 16.h,),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color : AppColors.appMainColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child : Center(
                  child : Text(
                    "Start Workout",
                    style: AppTextStyle.manropeSemiBold
                        .copyWith(color: Colors.white, fontSize: 14.sp),
                  ),
                )
            )
          ],
        )
    );
  }
}
