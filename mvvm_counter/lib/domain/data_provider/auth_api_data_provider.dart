abstract class AuthApiProviderError {}

class AuthApiProviderIncorectLoginDataError {}

class AuthApiProvide {
  Future<String> login(String login, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final isSucsess = login == 'admin' && password == '123456';
    if (isSucsess) {
      return 'qwerty123456';
    } else {
      throw AuthApiProviderIncorectLoginDataError();
    }
  }
}
