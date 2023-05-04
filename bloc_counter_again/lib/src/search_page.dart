// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_user_repository/search_user_repository.dart';

import 'package:bloc_counter_again/src/bloc/search_bloc/search_bloc.dart';
import 'package:bloc_counter_again/src/bloc/search_bloc/search_event.dart';

class SearhPage extends StatelessWidget {
  const SearhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SearchUserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchBloc(
                searchUserRepository:
                    RepositoryProvider.of<SearchUserRepository>(context)),
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
                final user = users[index];
                return ListTile(
                  title: Text(user.userName ?? ''),
                  leading: Hero(
                    tag: user.userName ?? '',
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.images ?? ''),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserInfoScreen(
                          user: user,
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: users.length,
            ),
          ),
      ],
    );
  }
}

class UserInfoScreen extends StatelessWidget {
  final UserModel user;
  const UserInfoScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          user.userName ?? '',
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: user.userName ?? '',
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.images ?? ''),
                ),
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 16,
              ),
              children: [
                const TextSpan(text: 'Visit site '),
                TextSpan(
                  text: user.url ?? '',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
