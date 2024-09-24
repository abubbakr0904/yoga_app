import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yoga_app/bloc/task/task_bloc.dart';
import 'package:yoga_app/data/local/storage_repository.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';
import 'package:yoga_app/data/model/task_model/task_model_addapter.dart';
import 'package:yoga_app/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          ScreenUtil.init(context);
          return MaterialApp(debugShowCheckedModeBanner: false, home: child);
        },
        child: const SplashScreen(),
      ),
    );
  }
}

