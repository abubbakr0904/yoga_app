import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class PoseItem extends StatelessWidget {
  const PoseItem({super.key, required this.image, required this.text1, required this.text2, required this.onTap, required this.isPremium});
  final String image;
  final String text1;
  final String text2;
  final VoidCallback onTap;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
                color: AppColors.cF5F5F5, borderRadius: BorderRadius.circular(24.r)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center ,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.asset(
                          image,
                          width: 56.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text1,
                              style: AppTextStyle.manropeSemiBold.copyWith(
                                fontSize: 12.sp,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Text(
                              text2,
                              style: AppTextStyle.manropeSemiBold.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(AppImages.arrowRight , width: 24.w,fit : BoxFit.cover)
              ],
            ),
          ),
        ),
        isPremium ? const SizedBox() : ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5
            ),
            child : Container(
              width: double.infinity,
              height: 77.h,
              child : Center(
                child : Text(
                  "Unlock",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.appMainColor
                  ),
                  maxLines: 1,
                ),
              )
            )
          ),
        )
      ],
    );
  }
}
