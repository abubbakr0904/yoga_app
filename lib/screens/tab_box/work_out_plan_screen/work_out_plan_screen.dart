import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/bloc/task/task_bloc.dart';
import 'package:yoga_app/bloc/task/task_event.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';
import 'package:yoga_app/screens/tab_box/work_out_plan_screen/widget/button_item.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class WorkOutPlanScreen extends StatefulWidget {
  const WorkOutPlanScreen({super.key});

  @override
  State<WorkOutPlanScreen> createState() => _WorkOutPlanScreenState();
}

class _WorkOutPlanScreenState extends State<WorkOutPlanScreen> {
  int a = 0;
  List<bool> isPressedList = List.generate(7, (index) => false);
  bool week = false;
  bool isSwitch = false;
  TimeOfDay time = const TimeOfDay(hour: 08, minute: 00);

  List<String> planDays = [];

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
              SizedBox(height: 52.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonItem(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      icon: AppImages.back),
                  ButtonItem(
                      onTap: () {
                        for (int i = 0; i < isPressedList.length; i++) {
                          if (isPressedList[i]) {
                            TaskModel taskModel = TaskModel(
                              id: i.toString(),
                              day: dayName[i],
                              isDone: false,
                            );
                            BlocProvider.of<TaskBloc>(context).add(
                              InsertTaskEvent(
                                taskModel: taskModel,
                              ),
                            );
                          }
                        }
                      },
                      icon: AppImages.tick),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "Workout plan",
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: Colors.black, fontSize: 28.sp),
              ),
              SizedBox(height: 35.h),
              Text(
                "Choose the difficulty of your workouts",
                style: AppTextStyle.manropeSemiBold.copyWith(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 19.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.cF5F5F5,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              a = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.w,
                            ),
                            decoration: BoxDecoration(
                              color: a == index
                                  ? AppColors.appMainColor
                                  : Colors.white.withOpacity(0.0),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              sentences[index],
                              style: AppTextStyle.manropeSemiBold.copyWith(
                                color: a == index
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.6),
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              Text(
                "Choose your workout days",
                style: AppTextStyle.manropeSemiBold.copyWith(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 19.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.cF5F5F5,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      7,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isPressedList[index] =
                                  !isPressedList[index]; // Toggle day state
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.w,
                            ),
                            decoration: BoxDecoration(
                              color: isPressedList[index]
                                  ? AppColors.appMainColor
                                  : AppColors.appMainColor.withOpacity(0.0),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Center(
                              child: Text(
                                weekDays[index],
                                style: AppTextStyle.manropeSemiBold.copyWith(
                                  color: isPressedList[index]
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.6),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    "Repeat every week",
                    style: AppTextStyle.manropeSemiBold.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CupertinoSwitch(
                    value: week,
                    onChanged: (v) {
                      setState(() {
                        week = v;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Text(
                "Enable workout reminders",
                style: AppTextStyle.manropeSemiBold.copyWith(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 29.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: AppColors.cF5F5F5,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                child: Column(
                  children: [
                    Row(
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
                            setState(() {
                              isSwitch = v;
                            });
                          },
                        )
                      ],
                    ),
                    isSwitch
                        ? SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode
                                  .time, // Show only time
                              initialDateTime: DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                time.hour,
                                time.minute,
                              ), // Initial time
                              onDateTimeChanged: (DateTime newDateTime) {
                                setState(() {
                                  time = TimeOfDay.fromDateTime(
                                      newDateTime); // Update time
                                });
                              },
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> sentences = ["Easy", "Medium", "Hard"];
List<String> weekDays = ["S", "M", "T", "W", "T", "F", "S"];
List<String> dayName = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
];
