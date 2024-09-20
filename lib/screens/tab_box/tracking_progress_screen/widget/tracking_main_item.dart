import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class TrackingMainItem extends StatelessWidget {
  const TrackingMainItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color : AppColors.appMainColor,
            borderRadius: BorderRadius.circular(24.r)
        ),
        child : Row(
          children: [
            SizedBox(
              height : 120.w,
              width: 120.w,
              child: Stack(
                children: [
                  SizedBox(
                    height : 120.w,
                    width: 120.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color : Colors.white,
                      value: 0.5,
                      backgroundColor: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  Center(
                    child: Text(
                      "50 %",
                      style: AppTextStyle.manropeBold
                          .copyWith(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w,),
            Expanded(
              child: Text(
                "Your workout progress",
                style: AppTextStyle.manropeBold
                    .copyWith(color: Colors.white, fontSize: 20.sp),
              ),
            ),
          ],
        )
    );
  }
}
