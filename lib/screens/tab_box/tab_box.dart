import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/screens/tab_box/home_screen/home_screen.dart';
import 'package:yoga_app/screens/tab_box/poses_screen/poses_screen.dart';
import 'package:yoga_app/screens/tab_box/statistics_screen/statistics_detail_screen/statistics_detail_screen.dart';
import 'package:yoga_app/screens/tab_box/statistics_screen/statistics_screen.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/images/app_images.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 1;

  @override
  void initState() {
    _screens = [
      const StatisticsScreen(),
      const HomeScreen(),
      const PosesScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 65.h, // Bottom navigation height
        child: Column(
          children: [
            Expanded(
              child: BottomNavigationBar(
                onTap: (newActiveIndex) {
                  _activeIndex = newActiveIndex;
                  setState(() {});
                },
                currentIndex: _activeIndex,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 16,
                unselectedFontSize: 14,
                backgroundColor: Colors.white,
                unselectedItemColor: const Color(0xFF9A9A9A),
                elevation: 10,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: SvgPicture.asset(AppImages.statisticsIcon , width:  26.w,height: 26.w,fit : BoxFit.cover ,  colorFilter: const ColorFilter.mode(AppColors.appMainColor, BlendMode.srcIn),),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(
                          bottom: 2.h
                      ),
                      child: SvgPicture.asset(AppImages.statisticsIcon , width:  26.w,height: 26.w,fit : BoxFit.cover ,  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcIn)),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: EdgeInsets.only(
                          bottom: 2.h
                      ),
                      child: SvgPicture.asset(AppImages.gymIcon , width:  26.w,height: 26.w,fit : BoxFit.cover ,  colorFilter: const ColorFilter.mode(AppColors.appMainColor, BlendMode.srcIn),),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(
                          bottom: 2.h
                      ),
                      child: SvgPicture.asset(AppImages.gymIcon , width:  26.w,height: 26.w,fit : BoxFit.cover  ,  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcIn)),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: SvgPicture.asset(AppImages.bookIcon , width:  26.w,height: 26.w,fit : BoxFit.cover ,  colorFilter: const ColorFilter.mode(AppColors.appMainColor, BlendMode.srcIn),),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: SvgPicture.asset(AppImages.bookIcon , width:  26.w,height: 26.w,fit : BoxFit.cover ,  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcIn),),
                    ),
                    label: "",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}