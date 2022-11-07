import 'package:mvvm_counter/domain/data_providers/auth_api_data_provider.dart';
import 'package:mvvm_counter/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _sessionDataProvide = SessionDataProvider();
  final _authApiProvider = AuthApiProvide();

  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvide.apiKey();
    return apiKey != null;
  }

  Future<void> login(String login, String password) async {
    final apiKey = await _authApiProvider.login(login, password);
    await _sessionDataProvide.saveApiKey(apiKey);
  }

  Future<void> logout() async {
    await _sessionDataProvide.clearApiKey();
  }
}
