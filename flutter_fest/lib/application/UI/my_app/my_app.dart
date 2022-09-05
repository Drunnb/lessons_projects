import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/navigation/main_navigation.dart';
import 'package:flutter_fest/application/UI/themes/app_theme.dart';
import 'package:flutter_fest/application/UI/widgets/top_notification/top_notififcation_manager.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      builder: (_, child) => TopNotificationManagerWidget(child: child),
    );
  }
}
