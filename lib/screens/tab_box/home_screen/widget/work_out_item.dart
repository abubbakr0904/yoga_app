import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class WorkOutItem extends StatelessWidget {
  const WorkOutItem({super.key, required this.image, required this.text, required this.text2});
  final String image;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w
      ),
      child: Stack(
        children: [
          Image.asset(image , width: 195.w, height: 210.h,fit : BoxFit.cover),
          Container(
              width: 195.w,
              height: 210.h,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.6),
                      ]
                  )
              ),
              child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: AppTextStyle.manropeSemiBold.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text(
                    text2,
                    style: AppTextStyle.manropeSemiBold.copyWith(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
