class TaskModel {
  final String id;
  final String day;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.day,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      day: json['day'] as String,
      isDone: json['is_done'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'is_done': isDone,
    };
  }

  TaskModel copyWith({
    String? id,
    String? day,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      day: day ?? this.day,
      isDone: isDone ?? this.isDone,
    );
  }

  static TaskModel initialValue() => TaskModel(id: "", day: "", isDone: false);
}
