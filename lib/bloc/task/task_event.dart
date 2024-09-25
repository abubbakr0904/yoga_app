import 'package:equatable/equatable.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';

abstract class TaskEvent extends Equatable {}

class InsertTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  InsertTaskEvent(
      {required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}


class GetTaskEvent extends TaskEvent {

  @override
  List<Object?> get props => [];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  UpdateTaskEvent({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}