import 'package:bloc_counter_again/src/bloc/counter_bloc.dart';
import 'package:bloc_counter_again/src/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_counter_again/src/bloc/user_bloc/user_event.dart';
import 'package:bloc_counter_again/src/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final counterBloc = BlocProvider.of<CounterBloc>(context);

      return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // final counterBloc = BlocProvider.of<CounterBloc>(context); старая форма записи

                counterBloc.add(CounterIncEvent());
              },
              icon: const Icon(Icons.plus_one),
            ),
            IconButton(
              onPressed: () {
                counterBloc.add(CounterDecEvent());
              },
              icon: const Icon(Icons.exposure_minus_1),
            ),
            IconButton(
              onPressed: () {
                final userBloc = context.read<UserBloc>();
                userBloc
                    .add(UserGetUsersEvent(context.read<CounterBloc>().state));
              },
              icon: const Icon(Icons.perm_contact_cal_rounded),
            ),
            IconButton(
              onPressed: () {
                final userBloc = context.read<UserBloc>();
                userBloc.add(
                    UserGetUsersJobEvent(context.read<CounterBloc>().state));
              },
              icon: const Icon(Icons.work),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, int>(
                  // bloc: counterBloc,
                  builder: (context, state) {
                    final users =
                        context.select((UserBloc bloc) => bloc.state.users);
                    return Column(
                      children: [
                        Text(
                          state.toString(),
                          style: const TextStyle(fontSize: 33),
                        ),
                        if (users.isNotEmpty) ...users.map((e) => Text(e.name)),
                      ],
                    );
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  // bloc: userBloc,
                  builder: (context, state) {
                    final users = state.users;
                    final job = state.job;
                    return Column(
                      children: [
                        if (state.isLoading) const CircularProgressIndicator(),
                        // if (users.isNotEmpty) ...users.map((e) => Text(e.name)),
                        if (job.isNotEmpty) ...job.map((e) => Text(e.name)),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
