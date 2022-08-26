part of 'task_bloc.dart';

class TaskState extends Equatable {
  List<Task> allTasks;
   TaskState({this.allTasks = const <Task>[]});

  @override
  List<Object?> get props => [allTasks];
}
