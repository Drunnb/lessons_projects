import 'package:mvvm_counter/domain/data_providers/user_data_provider.dart';
import 'package:mvvm_counter/domain/entity/user.dart';

class UserService {
  final _userDataProvider = UserDataProvider();

  User get user => _userDataProvider.user;
  Stream<User> get userStream => _userDataProvider.userStream;

  void openConnect() => _userDataProvider.openConnect();

  void closeConnect() => _userDataProvider.closeConnect();
}
