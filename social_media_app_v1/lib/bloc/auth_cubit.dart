import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signIn(
      {required String email, required String password}) async {}
  Future<void> signUp({
    required String email,
    required String nuserName,
    required String password,
  }) async {}
}
