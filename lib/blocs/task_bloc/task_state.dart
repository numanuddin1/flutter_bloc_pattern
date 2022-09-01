
import 'package:equatable/equatable.dart';

import '../../models/task.dart';

class TaskState extends Equatable {
  List<Task> pendingTasks;
  List<Task> completedTasks;
  List<Task> favoriteTasks;
  List<Task> removedTasks;

  TaskState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object?> get props => [pendingTasks, completedTasks, favoriteTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': this.pendingTasks,
      'completedTasks': this.completedTasks,
      'favoriteTasks': this.favoriteTasks,
      'removedTasks': this.removedTasks,
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks: map['pendingTasks'] as List<Task>,
      completedTasks: map['completedTasks'] as List<Task>,
      favoriteTasks: map['favoriteTasks'] as List<Task>,
      removedTasks: map['removedTasks'] as List<Task>,
    );
  }
}
