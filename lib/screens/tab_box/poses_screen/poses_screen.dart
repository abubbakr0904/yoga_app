import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/data/lists/poses_list.dart';
import 'package:yoga_app/data/local/storage_repository.dart';
import 'package:yoga_app/screens/tab_box/poses_screen/about_poses/about_poses_screen.dart';
import 'package:yoga_app/screens/tab_box/poses_screen/widget/pose_item.dart';
import 'package:yoga_app/screens/widget/global_appbar.dart';

class PosesScreen extends StatefulWidget {
  const PosesScreen({super.key});

  @override
  State<PosesScreen> createState() => _PosesScreenState();
}

class _PosesScreenState extends State<PosesScreen> {
  bool isPremium = false;

  @override
  void initState() {
    isPremium = StorageRepository.getBool(key: "is_premium");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: 6.w,
          left: 16.w,
          right: 16.w,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 2,
            ),
            const GlobalAppbar(text: "Yoga Poses"),
            SizedBox(
              height: 29.h,
            ),
            ...List.generate(
              poses.length,
              (index) {
                return PoseItem(
                  image: poses[index].image,
                  text1: "Standing Yoga Poses",
                  text2: poses[index].name,
                  isPremium: isPremium,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OpenPosesScreen(
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
