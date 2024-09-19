import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/tab_box/poses_screen/pose_item.dart';
import 'package:yoga_app/screens/widget/global_appbar.dart';
import 'package:yoga_app/utils/images/app_images.dart';

class PosesScreen extends StatefulWidget {
  const PosesScreen({super.key});

  @override
  State<PosesScreen> createState() => _PosesScreenState();
}

class _PosesScreenState extends State<PosesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 16.w,
          left: 16.w,
          right: 16.w,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 43.h,
            ),
            const GlobalAppbar(text: "Yoga Poses"),
            SizedBox(
              height: 29.h,
            ),
            ...List.generate(
              10,
              (index) {
                return const PoseItem(
                    image: AppImages.pose1,
                    text1: "Standing Yoga Poses",
                    text2: "Big Toe Pose");
              },
            )
          ],
        ),
      ),
    );
  }
}
