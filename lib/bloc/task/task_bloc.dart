import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:yoga_app/bloc/task/task_event.dart';
import 'package:yoga_app/bloc/task/task_state.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initialValue()) {
    on<InsertTaskEvent>(_insertTask);
    on<GetTaskEvent>(_getTask);
  }

  _insertTask(InsertTaskEvent event, Emitter<TaskState> emit) async {
    emit(
      state.copyWith(
        successMessage: "loading",
      ),
    );


    var box = Hive.box<TaskModel>('task_box');
    await box.add(event.taskModel);
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
    print(tasks.length.toString() + "\n\n\n\n\n");
    for(TaskModel i in tasks){
      taskss.add(i);
    }
    print("GET BRO--------------------------");
    emit(
      state.copyWith(
        successMessage: "success",
        allTasks: taskss
      ),
    );
    print("Mana uning uzunligi ${state.allTasks.length}");
  }
}
