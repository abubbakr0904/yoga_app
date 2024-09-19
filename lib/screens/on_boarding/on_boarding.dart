import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/data/local/storage_repository.dart';
import 'package:yoga_app/screens/on_boarding/pages/page1.dart';
import 'package:yoga_app/screens/on_boarding/pages/page2.dart';
import 'package:yoga_app/screens/on_boarding/pages/page3.dart';
import 'package:yoga_app/screens/on_boarding/pages/page4.dart';
import 'package:yoga_app/screens/tab_box/tab_box.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {},
              children: const [
                Page1Screen(),
                Page2Screen(),
                Page3Screen(),
                Page4Screen()
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (activeIndex == 3) {
                    StorageRepository.setBool(
                      key: "is_new_user",
                      value: true,
                    ).then(
                      (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabBox()),
                            (route) => false);
                      },
                    );
                  } else {
                    activeIndex += 1;
                    controller.animateToPage(
                      activeIndex,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.w),
                  margin: EdgeInsets.symmetric(horizontal: 67.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Text(
                    "Continue",
                    style: AppTextStyle.manropeSemiBold.copyWith(
                        color: AppColors.appMainColor, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Terms of Use",
                      style: AppTextStyle.manropeSemiBold
                          .copyWith(color: AppColors.white, fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Restore",
                      style: AppTextStyle.manropeSemiBold
                          .copyWith(color: AppColors.white, fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Privacy Policy",
                      style: AppTextStyle.manropeSemiBold
                          .copyWith(color: AppColors.white, fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 45.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
