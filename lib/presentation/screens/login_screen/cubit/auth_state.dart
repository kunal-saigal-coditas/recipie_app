part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserCredential userCred;
  const AuthSuccessState({
    required this.userCred,
  });

  AuthSuccessState copyWith(
      {UserCredential? userCred, bool? passwordVisiblity}) {
    return AuthSuccessState(
      userCred: userCred ?? this.userCred,
    );
  }
}

class AuthErrorState extends AuthState {}
