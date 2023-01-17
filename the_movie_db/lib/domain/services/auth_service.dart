import 'package:the_movie_db/domain/api_client/account_api_client.dart';
import 'package:the_movie_db/domain/api_client/auth_api_client.dart';
import 'package:the_movie_db/domain/data_providers/session_data_provider.dart';
import 'package:the_movie_db/ui/widgets/auth/auth_model.dart';

class AuthService implements AuthViewModelLoginProvider {
  final AuthApiClient authApiClient;

  final AccountApiClient accountApiClient;

  final SessionDataProvider sessionDataProvider;

  const AuthService({
    required this.authApiClient,
    required this.accountApiClient,
    required this.sessionDataProvider,
  });

  Future<bool> isAuth() async {
    final sessionId = await sessionDataProvider.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  @override
  Future<void> login(String login, String password) async {
    final sessionId = await authApiClient.auth(
      username: login,
      password: password,
    );
    final accountId = await accountApiClient.getAccountInfo(sessionId);
    await sessionDataProvider.setSessionId(sessionId);
    await sessionDataProvider.setAccountId(accountId);
  }

  Future<void> logout() async {
    await sessionDataProvider.deleteSessionId();
    await sessionDataProvider.deleteAccountId();
  }
}
