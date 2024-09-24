import 'package:equatable/equatable.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';

class TaskState extends Equatable {
  final TaskModel taskModel;
  final String errorMessage;
  final String successMessage;
  final List<TaskModel> allTasks;

  const TaskState({
    required this.allTasks,
    required this.taskModel,
    required this.successMessage,
    required this.errorMessage,
  });

  TaskState copyWith({
    TaskModel? taskModel,
    String? successMessage,
    String? errorMessage,
    final List<TaskModel>? allTasks,
  }) {
    return TaskState(
      taskModel: taskModel ?? this.taskModel,
      successMessage: successMessage ?? this.successMessage,
      allTasks: allTasks ?? this.allTasks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  static TaskState initialValue() => TaskState(
        allTasks: const [],
        taskModel: TaskModel.initialValue(),
        successMessage: "",
        errorMessage: '',
      );

  @override
  List<Object?> get props => [
        taskModel,
        successMessage,
        errorMessage,
        allTasks,
      ];
}
