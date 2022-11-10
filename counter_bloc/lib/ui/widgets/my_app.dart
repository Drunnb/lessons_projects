import 'package:counter_bloc/domain/blocs/users_bloc.dart';
import 'package:counter_bloc/ui/widgets/example_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // onGenerateRoute: (RouteSettings settings) {
      //   if (settings.name == 'auth') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //           AuthWidget.create(),
      //       transitionDuration: Duration.zero,
      //     );
      //   } else if (settings.name == 'example') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //           ExampleWidget.create(),
      //       transitionDuration: Duration.zero,
      //     );
      //   } else if (settings.name == 'loader') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //           LoaderWidget.create(),
      //       transitionDuration: Duration.zero,
      //     );
      //   }
      //   return null;
      // },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<UsersCubit>(
        create: (_) => UsersCubit(),
        child: const ExampleWidget(),
        dispose: (context, value) => value.close(),
      ),
    );
  }
}
