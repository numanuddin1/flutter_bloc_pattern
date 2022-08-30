
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

class TaskState extends Equatable {
  List<Task> allTasks;
  List<Task> removedTasks;

  TaskState({
    this.allTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object?> get props => [allTasks, removedTasks];
}
