import 'package:notas/src/core/constants/parameters.dart';

class Task{
  String? title;
  String? date;
  String? description;
  List<String>? url;
  TaskState? state;


  Task({
    this.title,
    this.date,
    this.description,
    this.url,
    this.state = TaskState.Create
  });
}