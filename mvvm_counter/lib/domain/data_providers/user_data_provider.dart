import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mvvm_counter/domain/entity/user.dart';

class UserDataProvider extends ChangeNotifier {
  Timer? _timer;
  var _user = User(0);

  final _controller = StreamController<User>();

  Stream<User> get userStream => _controller.stream.asBroadcastStream();
  User get user => _user;

  void openConnect() {
    if (_timer != null) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _user = User(_user.age + 1);
      _controller.add(_user);
      notifyListeners();
    });
  }

  void closeConnect() {
    _timer?.cancel();
    _timer = null;
  }
}
