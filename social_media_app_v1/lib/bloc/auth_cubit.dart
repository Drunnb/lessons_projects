import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSignedIn());
    } on FirebaseAuth catch (e) {
      if (e == 'user-not-found') {
        emit(AuthFailure(message: 'No user found for that email.'));
      } else if (e == 'wrong-password') {
        emit(AuthFailure(message: 'Wrong password provided for that user.'));
      }
    } catch (error) {
      emit(AuthFailure(message: 'An error has accurated'));
    }
  }

  Future<void> signUp({
    required String email,
    required String nuserName,
    required String password,
  }) async {
    emit(AuthLoading());
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'userID': userCredential.user?.uid,
        'userName': nuserName,
        'email': email
      });
      emit(AuthSignedUp());
    } on FirebaseAuth catch (e) {
      if (e == 'weak-password') {
        emit(AuthFailure(message: 'The password provided is too weak.'));
      } else if (e == 'email-already-in-use') {
        emit(
            AuthFailure(message: 'The account already exists for that email.'));
      }
    } catch (error) {
      emit(AuthFailure(message: 'An error has accurated'));
    }
  }
}
