import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAction {
  factory DelayedAction() => _instance;
  DelayedAction._();

  static final DelayedAction _instance = DelayedAction._();

  static Timer? _timer;
  static void run(
    VoidCallback action, {
    Duration delay = const Duration(milliseconds: 200),
  }) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
