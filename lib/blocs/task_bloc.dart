import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/task.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTaskEvent>((event, emit) {
      var state = this.state;
      emit(TaskState(allTasks: List.from(state.allTasks)..add(event.task)));
    });
    on<DeleteTaskEvent>((event, emit) {
      var state = this.state;
      emit(TaskState(allTasks: List.from(state.allTasks)..remove(event.task)));
    });

    on<UpdateTaskEvent>((event, emit) {
      final state = this.state;
      final task = event.task;
      final int index = state.allTasks.indexOf(task);
      List<Task> allTasks = List.from(state.allTasks..remove(task));
      task.isDone == false
          ? allTasks.insert(index, task.copyWith(isDone: true))
          : allTasks.insert(index, task.copyWith(isDone: false));
      emit(TaskState(allTasks: allTasks));
    });
  }
}
