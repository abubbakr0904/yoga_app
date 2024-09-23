import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/data/lists/poses_list.dart';
import 'package:yoga_app/screens/tab_box/poses_screen/about_poses/widget/about_poses.dart';
import 'package:yoga_app/screens/tab_box/work_out_plan_screen/widget/button_item.dart';
import 'package:yoga_app/utils/images/app_images.dart';

class OpenPosesScreen extends StatefulWidget {
  const OpenPosesScreen({super.key, required this.index});

  final int index;

  @override
  State<OpenPosesScreen> createState() => _OpenPosesScreenState();
}

class _OpenPosesScreenState extends State<OpenPosesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              ButtonItem(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: AppImages.back,
              ),
              AboutPoses(
                title: poses[widget.index].name,
                description: poses[widget.index].descriptions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
