import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class AboutPoses extends StatelessWidget {
  const AboutPoses({super.key, required this.title, required this.description});
  final String title;
  final List<String> description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
        ),
        Text(
          title,
          style: AppTextStyle.manropeSemiBold
              .copyWith(color: Colors.black, fontSize: 20.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        ...List.generate(description.length, (index) {
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
                description[index],
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
