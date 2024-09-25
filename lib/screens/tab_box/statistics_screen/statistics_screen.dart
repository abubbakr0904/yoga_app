import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/bloc/task/task_bloc.dart';
import 'package:yoga_app/bloc/task/task_event.dart';
import 'package:yoga_app/bloc/task/task_state.dart';
import 'package:yoga_app/screens/tab_box/statistics_screen/statistics_detail_screen/statistics_detail_screen.dart';
import 'package:yoga_app/screens/tab_box/statistics_screen/statistics_detail_screen/widget/statistics_item.dart';
import 'package:yoga_app/screens/widget/global_appbar.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(GetTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.allTasks.isEmpty) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 23.h,
                      ),
                      const GlobalAppbar(text: "Statistics"),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        AppImages.statisticsImage,
                        width: 164.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Unlock access to statistics",
                        style: AppTextStyle.manropeSemiBold.copyWith(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StatisticsDetailScreen()));
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.w),
                          margin: EdgeInsets.symmetric(horizontal: 67.w),
                          decoration: BoxDecoration(
                              color: AppColors.appMainColor,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Text(
                            "Continue",
                            style: AppTextStyle.manropeSemiBold.copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 37.h,
                  ),
                  const GlobalAppbar(text: "Statistics"),
                  SizedBox(
                    height: 32.h,
                  ),
                  const StatisticsItem(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                        color: AppColors.cF5F5F5,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Column(
                      children: [
                        Text(
                          "Popular days to work out",
                          style: AppTextStyle.manropeSemiBold.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12.sp),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              7,
                              (index) {
                                bool isHave = false;
                                for (int i = 0;
                                    i < state.allTasks.length;
                                    i++) {
                                  if (state.allTasks[i].day ==
                                      weekDays[index]) {
                                    isHave = state.allTasks[i].isDone == false;
                                  }
                                }
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 10.w),
                                    decoration: BoxDecoration(
                                        color: isHave
                                            ? AppColors.appMainColor
                                            : AppColors.appMainColor
                                                .withOpacity(0.0),
                                        borderRadius:
                                            BorderRadius.circular(16.r)),
                                    child: Center(
                                      child: Text(
                                        weekDays[index].substring(0, 1),
                                        style: AppTextStyle.manropeSemiBold
                                            .copyWith(
                                                color: isHave
                                                    ? Colors.white
                                                    : Colors.black
                                                        .withOpacity(0.6),
                                                fontSize: 12.sp),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.cF5F5F5,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Your workouts this month",
                          style: AppTextStyle.manropeSemiBold.copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...List.generate(
                                  7,
                                  (index) {
                                    bool isHas = false;
                                    for (int i = 0;
                                        i < state.allTasks.length;
                                        i++) {
                                      if (state.allTasks[i].day ==
                                          weekDays[index]) {
                                        isHas = state.allTasks[i].isDone == false;
                                      }
                                    }
                                    return Column(
                                      children: [
                                        Container(
                                          width: 16.w,
                                          height: 160.h,
                                          decoration: BoxDecoration(
                                              color: isHas
                                                  ? AppColors.appMainColor
                                                  : AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100.r)),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          "${index + 1}",
                                          style: AppTextStyle.manropeSemiBold
                                              .copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 12.sp),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

List<String> weekDays = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
];
