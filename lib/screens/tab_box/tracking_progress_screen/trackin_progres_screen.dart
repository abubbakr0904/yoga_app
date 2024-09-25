import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_app/bloc/task/task_bloc.dart';
import 'package:yoga_app/bloc/task/task_event.dart';
import 'package:yoga_app/bloc/task/task_state.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';
import 'package:yoga_app/screens/tab_box/tracking_progress_screen/ui/video_screen/video_screen.dart';
import 'package:yoga_app/screens/tab_box/tracking_progress_screen/widget/dialog.dart';
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
  int a = 0;

  init() {
    BlocProvider.of<TaskBloc>(context).add(GetTaskEvent());
  }

  @override
  void initState() {
    init();
    super.initState();
  }

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
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        ...List.generate(
                          state.allTasks.length,
                          (index) {
                            return WorkoutItem(
                              dayName: state.allTasks[index].day,
                              onTap: () {
                                if (state.allTasks[index].isDone == false) {
                                  TaskModel taskModel = state.allTasks[index];
                                  taskModel = taskModel.copyWith(
                                      isDone: true
                                  );
                                  BlocProvider.of<TaskBloc>(context).add(
                                      UpdateTaskEvent(taskModel: taskModel)
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => YouTubeVideoPlayer(
                                        videoUrl:
                                            "https://www.youtube.com/watch?v=IYSkQLXbtHE",
                                        onChange: () {
                                          setState(
                                            () {
                                              a++;
                                            },
                                          );
                                          init();
                                        },
                                        taskModel: state.allTasks[index],
                                      ),
                                    ),
                                  );
                                  int count = 0;
                                  for(int i  = 0 ; i < state.allTasks.length ; i++){
                                    if(state.allTasks[i].isDone){
                                      count++;
                                    }
                                  }
                                  print("Mana uning uzunligi $count\\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
                                  if(count == state.allTasks.length){
                                    showMyDialog(context);
                                  }
                                }
                              },
                              onSelected: state.allTasks[index].isDone,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          )),
    );
  }
}
