import 'dart:async';

import 'package:bloc_counter_again/src/bloc/counter_bloc.dart';
import 'package:bloc_counter_again/src/bloc/user_bloc/user_event.dart';
import 'package:bloc_counter_again/src/bloc/user_bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CounterBloc counterBloc;
  late final StreamSubscription counterBlocSubscription;

  UserBloc(this.counterBloc) : super(UserState()) {
    on<UserGetUsersEvent>(_onGetUser);
    on<UserGetUsersJobEvent>(_onGetUsersJob);
    counterBlocSubscription = counterBloc.stream.listen((state) {
      if (state <= 0) {
        add(UserGetUsersEvent(0));
        add(UserGetUsersJobEvent(0));
      }
    });
  }

  @override
  Future<void> close() async {
    counterBlocSubscription.cancel();
    return super.close();
  }

  _onGetUser(UserGetUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final users = List.generate(
        event.count, ((index) => User(name: 'UserName $index', id: index)));
    emit(state.copyWith(users: users));
  }

  _onGetUsersJob(UserGetUsersJobEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final job = List.generate(
        event.count, ((index) => Job(name: 'JobName $index', id: index)));
    emit(state.copyWith(job: job));
  }
}
