part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationDone extends AuthenticationState {
  final UserEntity user;

  AuthenticationDone({required this.user});
}
class AuthenticationAllDone extends AuthenticationState {
  final UserEntity user;
  final int notesCount;
  final int categoriesCount;

  AuthenticationAllDone({required this.user, required this.notesCount, required this.categoriesCount});
}
