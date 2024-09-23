import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/data/lists/work_out_lists.dart';
import 'package:yoga_app/screens/tab_box/work_out_plan_screen/open_workout_screen/widget/about_workout.dart';
import 'package:yoga_app/screens/tab_box/work_out_plan_screen/widget/button_item.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class OpenWorkoutScreen extends StatefulWidget {
  const OpenWorkoutScreen({super.key});

  @override
  State<OpenWorkoutScreen> createState() => _OpenWorkoutScreenState();
}

class _OpenWorkoutScreenState extends State<OpenWorkoutScreen> {
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
                height: 52.h,
              ),
              ButtonItem(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: AppImages.back,
              ),
              Text(
                "20-Minute Power Yoga Workout",
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: Colors.black, fontSize: 28.sp),
              ),
              ...List.generate(
                workOutList.length,
                (index) {
                  return AboutWorkout(
                    title: "${index + 1}. ${workOutList[index].title}",
                    image: workOutList[index].image,
                    step: workOutList[index].step,
                    descriptions: workOutList[index].description,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
