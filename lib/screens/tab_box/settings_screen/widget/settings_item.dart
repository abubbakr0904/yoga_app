import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';

import '../../../../utils/style/app_text_style.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color : AppColors.cF5F5F5,
                    borderRadius: BorderRadius.circular(24.r)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.book , width: 40.w , fit : BoxFit.cover),
                    SizedBox(height: 24.h,),
                    Text(
                      "Terms of Use",
                      style: AppTextStyle.manropeSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const  Expanded(
                flex: 1,
                child : SizedBox()
            ),
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color : AppColors.cF5F5F5,
                    borderRadius: BorderRadius.circular(24.r)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.police , width: 40.w , fit : BoxFit.cover),
                    SizedBox(height: 24.h,),
                    Text(
                      "Price of Policy",
                      style: AppTextStyle.manropeSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color : AppColors.cF5F5F5,
                    borderRadius: BorderRadius.circular(24.r)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.share , width: 40.w , fit : BoxFit.cover),
                    SizedBox(height: 24.h,),
                    Text(
                      "Terms of Use",
                      style: AppTextStyle.manropeSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
                flex: 1,
                child : SizedBox()
            ),
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color : AppColors.cF5F5F5,
                    borderRadius: BorderRadius.circular(24.r)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.message , width: 40.w , fit : BoxFit.cover),
                    SizedBox(height: 24.h,),
                    Text(
                      "Price of Policy",
                      style: AppTextStyle.manropeSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
