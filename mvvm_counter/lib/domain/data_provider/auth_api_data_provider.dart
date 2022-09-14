abstract class AuthApiProviderError {}

class AuthApiProviderIncorectLoginDataError {}

class AuthApiProvide {
  Future<String> login(String login, String password) async {
    final isSucsess = login == 'admin' && password == '123456';
    if (isSucsess) {
      return 'qwerty123456';
    } else {
      throw AuthApiProviderIncorectLoginDataError();
    }
  }
}
