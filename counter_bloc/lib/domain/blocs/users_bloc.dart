import 'dart:async';
import 'dart:math';

import 'package:counter_bloc/domain/data_providers/user_data_provider.dart';
import 'package:counter_bloc/domain/entity/user.dart';

class UsersState {
  final User currentUser;
  UsersState({
    required this.currentUser,
  });

  UsersState copyWith({
    User? currentUser,
  }) {
    return UsersState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  String toString() => 'UsersState(currentUser: $currentUser)';

  @override
  bool operator ==(covariant UsersState other) {
    if (identical(this, other)) return true;

    return other.currentUser == currentUser;
  }

  @override
  int get hashCode => currentUser.hashCode;
}

class UsersBloc {
  final _userDataProvider = UserDataProvider();
  var _state = UsersState(currentUser: User(0));

  final _stateController = StreamController<UsersState>.broadcast();

  UsersState get state => _state;

  Stream<UsersState> get stream => _stateController.stream;

  UsersBloc() {
    _initilalize();
  }
  void updateState(UsersState state) {
    if (_state == state) return;
    _state = state;
    _stateController.add(state);
  }

  Future<void> _initilalize() async {
    final user = await _userDataProvider.loadValue();
    updateState(_state.copyWith(currentUser: user));
  }

  void incrementAge() {
    var user = _state.currentUser;
    user = user.copyWith(age: user.age + 1);
    updateState(_state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }

  void decrementAge() {
    var user = _state.currentUser;
    user = user.copyWith(age: max(user.age - 1, 0));
    updateState(_state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }
}
