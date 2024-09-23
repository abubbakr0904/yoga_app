import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/data/local/storage_repository.dart';
import 'package:yoga_app/screens/on_boarding/pages/widget/page4_item.dart';
import 'package:yoga_app/screens/tab_box/tab_box.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Stack(
        children: [
          Image.asset(
            AppImages.onBoardingPage4,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.only(top: 50.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabBox()));
                      },
                      icon: const Icon(Icons.close, color: Colors.white)),
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20.w),
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Column(
                          children: [
                            const Page4Item(
                                text: "Get your workout statistics"),
                            SizedBox(height: 8.h),
                            const Page4Item(text: "Create your own workouts"),
                            SizedBox(height: 8.h),
                            const Page4Item(text: "Access to all asanas"),
                          ],
                        )),
                    Text(
                      "Get full access to  the app",
                      style: AppTextStyle.manropeSemiBold
                          .copyWith(color: Colors.white, fontSize: 28.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Unlock all the features in just \$0.99",
                      style: AppTextStyle.manropeSemiBold
                          .copyWith(color: Colors.white, fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        StorageRepository.setBool(
                            key: "is_premium", value: true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabBox()));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15.w),
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
                            style: AppTextStyle.manropeSemiBold.copyWith(
                                color: AppColors.white, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Restore",
                            style: AppTextStyle.manropeSemiBold.copyWith(
                                color: AppColors.white, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Privacy Policy",
                            style: AppTextStyle.manropeSemiBold.copyWith(
                                color: AppColors.white, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
