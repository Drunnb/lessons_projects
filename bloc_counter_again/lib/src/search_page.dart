import 'package:bloc_counter_again/src/bloc/search_bloc/search_bloc.dart';
import 'package:bloc_counter_again/src/bloc/search_bloc/search_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearhPage extends StatelessWidget {
  const SearhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 33),
            bodyLarge: TextStyle(fontSize: 22),
          ),
        ),
        home: const Scaffold(
          body: SafeArea(
            child: MainSearchWidget(),
          ),
        ),
      ),
    );
  }
}

class MainSearchWidget extends StatelessWidget {
  const MainSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.select((SearchBloc bloc) => bloc.state.users);
    return Column(
      children: [
        const Text('Search User'),
        const SizedBox(height: 28),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'User name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchUserEvent(value));
          },
        ),
        if (users.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['username']),
                );
              },
              itemCount: users.length,
            ),
          ),
      ],
    );
  }
}
