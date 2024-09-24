import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/screens/tab_box/tracking_progress_screen/ui/video_screen/video_screen.dart';
import 'package:yoga_app/screens/tab_box/tracking_progress_screen/widget/tracking_main_item.dart';
import 'package:yoga_app/screens/tab_box/tracking_progress_screen/widget/workout_item.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class TrackingProgressScreen extends StatefulWidget {
  const TrackingProgressScreen({super.key});

  @override
  State<TrackingProgressScreen> createState() => _TrackingProgressScreenState();
}

class _TrackingProgressScreenState extends State<TrackingProgressScreen> {
  List<bool> isPressedList = List.generate(5, (index) => true);
  int a = 3;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
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
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                "Progress Tracking",
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: Colors.black, fontSize: 28.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              TrackingMainItem(
                isDone: (1 / 5) * a,
              ),
              SizedBox(
                height: 34.h,
              ),
              Text(
                "Your workouts",
                style: AppTextStyle.manropeSemiBold
                    .copyWith(color: Colors.black, fontSize: 20.sp),
              ),
              ...List.generate(
                5,
                (index) {
                  return WorkoutItem(
                    onTap: () {
                      if (isPressedList[index]) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YouTubeVideoPlayer(
                              videoUrl:
                                  "https://www.youtube.com/watch?v=IYSkQLXbtHE",
                              onChange: (){
                                setState(() {
                                  a++;
                                });
                              },
                            ),
                          ),
                        );
                      }
                      isPressedList[index] = !isPressedList[index];
                    },
                    onSelected: isPressedList[index],
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
