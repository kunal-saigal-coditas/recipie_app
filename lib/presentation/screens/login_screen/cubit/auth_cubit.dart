import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:recipe_app/core/services/database.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // await DatabaseServices(uid: userCredential.user!.uid)
      //     .setForumGroupsData();
      emit(
        AuthSuccessState(
          userCred: userCredential,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(
        AuthErrorState(),
      );
    }
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(
        AuthSuccessState(
          userCred: userCredential,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(
        AuthErrorState(),
      );
    }
  }
}
