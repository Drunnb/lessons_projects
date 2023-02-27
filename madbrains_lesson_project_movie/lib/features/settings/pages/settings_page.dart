// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsArguments {
  final String name;

  SettingsArguments(this.name);
}

class SettingsPage extends StatelessWidget {
  final SettingsArguments arguments;

  const SettingsPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  static const path = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('user:${arguments.name}'),
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(Icons.exit_to_app),
                  Text('Exit'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(Icons.arrow_back),
                  Text('Back'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
