import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pattern/blocs/task_bloc/task_state.dart';

import '../../models/task.dart';

part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTaskEvent>((event, emit) {
      var state = this.state;
      emit(TaskState(
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          removedTasks: state.removedTasks,
          completedTasks: state.completedTasks,
          favoriteTasks: state.favoriteTasks));
    });
    on<UpdateTaskEvent>((event, emit) {
      final state = this.state;
      final task = event.task;
      List<Task> pendingTasks = state.pendingTasks;
      List<Task> completedTasks = state.completedTasks;
      task.isDone == false
          ? {
              pendingTasks = List.from(pendingTasks)..remove(task),
              completedTasks = List.from(completedTasks)
                ..insert(0, task.copyWith(isDone: true))
            }
          : {
              completedTasks = List.from(completedTasks)..remove(task),
              pendingTasks = List.from(pendingTasks)
                ..insert(0, task.copyWith(isDone: false))
            };
      emit(TaskState(
          pendingTasks: pendingTasks,
          completedTasks: completedTasks,
          favoriteTasks: state.favoriteTasks,
          removedTasks: state.removedTasks));
    });

    on<DeleteTaskEvent>((event, emit) {
      var state = this.state;
      emit(TaskState(
          pendingTasks: state.pendingTasks,
          completedTasks: state.completedTasks,
          favoriteTasks: state.favoriteTasks,
          removedTasks: List.from(state.removedTasks)
            ..remove(event.task)));
    });

    on<RemovedTaskEvent>((event, emit) {
      var state = this.state;
      emit(TaskState(
          pendingTasks: List.from(state.pendingTasks)..remove(event.task),
          completedTasks: List.from(state.completedTasks)..remove(event.task),
          favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
          removedTasks: List.from(state.removedTasks)
            ..add(event.task.copyWith(isDeleted: true))));
    });
  }
  @override
  TaskState? fromJson(Map<String, dynamic> json){
    return TaskState.fromMap(json);
  }
  @override
  Map<String, dynamic>? toJson(TaskState state){
    return state.toMap();
  }
}
