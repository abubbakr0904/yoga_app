import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/utils/colors/app_colors.dart';
import 'package:yoga_app/utils/style/app_text_style.dart';

class TrackingMainItem extends StatefulWidget {
  const TrackingMainItem({super.key, required this.isDone});
  final double isDone;

  @override
  _TrackingMainItemState createState() => _TrackingMainItemState();
}

class _TrackingMainItemState extends State<TrackingMainItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: widget.isDone).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 120.w,
            width: 120.w,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return SizedBox(
                      height: 120.w,
                      width: 120.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Colors.white,
                        value: _animation.value,
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),

                    );
                  },
                ),
                Center(
                  child: Text(
                    "50 %",
                    style: AppTextStyle.manropeBold
                        .copyWith(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "Your workout progress",
              style: AppTextStyle.manropeBold
                  .copyWith(color: Colors.white, fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
