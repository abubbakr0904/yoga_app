import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/data/local/storage_repository.dart';
import 'package:yoga_app/screens/on_boarding/on_boarding.dart';
import 'package:yoga_app/screens/on_boarding/pages/premium_screen.dart';
import 'package:yoga_app/screens/tab_box/tab_box.dart';
import 'package:yoga_app/utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  init() async {
    await Future.delayed(const Duration(seconds: 4));
    bool user = StorageRepository.getBool(key: "is_new_user");
    bool premium = StorageRepository.getBool(key: "is_premium");
    if(user && premium){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const TabBox(),
          ),
              (route) => false);
    }
    else if(user || premium){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const PremiumScreen(),
          ),
              (route) => false);
    }
    else{
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
            child: SvgPicture.asset(
              AppImages.appLogo,
              width: 191.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
