import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/tab_box/statistics_screen/statistics_detail_screen/widget/statistics_item.dart';
import 'package:yoga_app/screens/widget/global_appbar.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class StatisticsDetailScreen extends StatefulWidget {
  const StatisticsDetailScreen({super.key});

  @override
  State<StatisticsDetailScreen> createState() => _StatisticsDetailScreenState();
}

class _StatisticsDetailScreenState extends State<StatisticsDetailScreen> {
  List<bool> isPressedList = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 57.h,
            ),
            const GlobalAppbar(text: "Statistics"),
            SizedBox(
              height: 37.h,
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
                        color: Colors.black.withOpacity(0.6), fontSize: 12.sp),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        7,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isPressedList[index] = !isPressedList[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.w),
                              decoration: BoxDecoration(
                                  color: isPressedList[index]
                                      ? AppColors.appMainColor
                                      : AppColors.appMainColor.withOpacity(0.0),
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Center(
                                child: Text(
                                  weekDays[index],
                                  style: AppTextStyle.manropeSemiBold.copyWith(
                                      color: isPressedList[index]
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.6),
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
                        color: Colors.black.withOpacity(0.6), fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          30,
                          (index) {
                            return Column(
                              children: [
                                Container(
                                  width: 16.w,
                                  height: 160.h,
                                  margin: EdgeInsets.only(
                                    right: 8.w
                                  ),
                                  decoration: BoxDecoration(
                                      color: index % 3 == 0 ? AppColors.appMainColor : AppColors.white,
                                      borderRadius: BorderRadius.circular(100.r)),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "${index + 1}",
                                  style: AppTextStyle.manropeSemiBold.copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 12.sp),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> weekDays = ["S", "M", "T", "W", "T", "F", "S"];
