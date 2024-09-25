import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:yoga_app/bloc/task/task_event.dart';
import 'package:yoga_app/bloc/task/task_state.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initialValue()) {
    on<InsertTaskEvent>(_insertTask);
    on<GetTaskEvent>(_getTask);
    on<UpdateTaskEvent>(_updateTask);
  }

  _insertTask(InsertTaskEvent event, Emitter<TaskState> emit) async {
    emit(
      state.copyWith(
        successMessage: "loading",
      ),
    );
    var box = Hive.box<TaskModel>('task_box');
    await box.put(event.taskModel.day , event.taskModel);
    print("SAVE BRO--------------------------");
    emit(
      state.copyWith(
        successMessage: "success",
      ),
    );
  }

  _getTask(GetTaskEvent event, Emitter<TaskState> emit) async {
    emit(
      state.copyWith(
        successMessage: "loading",
      ),
    );
    var box = Hive.box<TaskModel>('task_box');
    var tasks = box.values;
    List<TaskModel> taskss = [];
    for(TaskModel i in tasks){
      taskss.add(i);
    }
    print("GET BRO -------------------------\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    emit(
      state.copyWith(
        successMessage: "success",
        allTasks: taskss
      ),
    );
  }

  _updateTask(UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(
      state.copyWith(
        successMessage: "loading",
      ),
    );
    var box = Hive.box<TaskModel>('task_box');
    await box.put(event.taskModel.day , event.taskModel);
    emit(
      state.copyWith(
        successMessage: "update",
      ),
    );
    debugPrint("UPDATE BRO ------------");
  }

}
