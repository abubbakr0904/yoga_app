import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/data/local/storage_repository.dart';
import 'package:yoga_app/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(const MyApp());
  StorageRepository.instance;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          ScreenUtil.init(context);
          return MaterialApp(debugShowCheckedModeBanner: false, home: child);
        },
        child: const SplashScreen());
  }
}
