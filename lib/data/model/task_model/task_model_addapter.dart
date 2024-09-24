import 'package:hive/hive.dart';
import 'package:yoga_app/data/model/task_model/task_model.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(
      id: reader.readString(),
      day: reader.readString(),
      isDone: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.day);
    writer.writeBool(obj.isDone);
  }
}
