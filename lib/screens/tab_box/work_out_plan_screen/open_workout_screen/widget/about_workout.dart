import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class AboutWorkout extends StatelessWidget {
  const AboutWorkout({super.key, required this.title, required this.image, required this.step, required this.descriptions});
  final String title;
  final String image;
  final int step;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
        ),
        Text(
          title,
          style: AppTextStyle.manropeSemiBold
              .copyWith(color: Colors.black, fontSize: 20.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        Image.asset(image, width: double.infinity, fit: BoxFit.cover),
        SizedBox(
          height: 16.h,
        ),
        ...List.generate(step, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Step ${index + 1}",
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: Colors.black, fontSize: 16.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                descriptions[index],
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: Colors.black, fontSize: 14.sp),
              ),
            ],
          );
        })
      ],
    );
  }
}
