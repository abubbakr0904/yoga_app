import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/tab_box/home_screen/widget/home_screen_main_item.dart';
import 'package:yoga_app/screens/tab_box/home_screen/widget/work_out_item.dart';
import 'package:yoga_app/screens/widget/global_appbar.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 57.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlobalAppbar(
                  text: "Yoga Fans",
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  "Workout plan",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                HomeScreenMainItem(onTap: () {}),
                SizedBox(
                  height: 34.h,
                ),
                Text(
                  "Popular workouts",
                  style: AppTextStyle.manropeSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  3,
                  (index) {
                    return WorkOutItem(
                      image: images[index],
                      text: texts[index],
                      text2: texts2[index],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<String> images = [
  AppImages.workOutCard1,
  AppImages.workOutCard2,
  AppImages.workOutCard3
];
List<String> texts = [
  "20-Minute Power Yoga Workout",
  "Asana complex for proper work of the diaphragm",
  "7 variations of the plank to pump up your whole body"
];
List<String> texts2 = ["Full Body", "Diaphragm ", "Full Body"];
