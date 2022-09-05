import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/widgets/top_notification/top_notification_overlay_widget.dart';
import 'package:provider/provider.dart';

abstract class TopNotificationManager {
  void show(String text) {}
}

class TopNotificationManagerWidget extends StatefulWidget {
  final Widget? child;
  const TopNotificationManagerWidget({
    super.key,
    this.child,
  });

  @override
  State<TopNotificationManagerWidget> createState() =>
      _TopNotificationManagerWidgetState();
}

class _TopNotificationManagerWidgetState
    extends State<TopNotificationManagerWidget>
    implements TopNotificationManager {
  final _topNotificationOvelayKey =
      GlobalKey<TopNotificationOvelayWidgetState>();

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    final child = widget.child;
    if (child != null) {
      children.add(child);
    }
    final topNotificationOvelayWidget = TopNotificationOvelayWidget(
      key: _topNotificationOvelayKey,
    );
    children.add(topNotificationOvelayWidget);
    return Provider<TopNotificationManager>.value(
      value: this,
      child: Stack(
        children: children,
      ),
    );
  }

  @override
  void show(String text) {
    _topNotificationOvelayKey.currentState?.show(text);
    print(text);
  }
}
