import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/screens/tab_box/settings_screen/widget/settings_item.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 34.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                  color: AppColors.cF5F5F5,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.back,
                  width: 24.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Settings",
            style: AppTextStyle.manropeSemiBold.copyWith(
              fontSize: 28.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.appMainColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppImages.crown,
                      width: 24.w, fit: BoxFit.cover),
                  Text(
                    "Get full access to  the app",
                    style: AppTextStyle.manropeSemiBold.copyWith(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.cF5F5F5),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Receive notifications",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                CupertinoSwitch(
                  value: isSwitch,
                  onChanged: (v) {
                    setState(
                      () {
                        isSwitch = v;
                      },
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          const SettingsItem()
        ],
      ),
    ));
  }
}
