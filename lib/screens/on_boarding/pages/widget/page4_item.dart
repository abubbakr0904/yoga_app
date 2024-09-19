import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class Page4Item extends StatelessWidget {
  const Page4Item({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 4.w,
          height: 4.w,
          decoration: BoxDecoration(
              color : Colors.white,
              borderRadius: BorderRadius.circular(50.r)
          ),
        ),
        Text(
          " $text",
          style: AppTextStyle.manropeSemiBold
              .copyWith(color: Colors.white, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
