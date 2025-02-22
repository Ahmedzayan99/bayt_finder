part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class ActiveButtonState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginErrorState extends LoginState {}
final class LoginSuccessState extends LoginState {}
final class ClearDataState extends LoginState {}
final class ResendTimeout extends LoginState {}
final class ChangeFromState extends LoginState {}
