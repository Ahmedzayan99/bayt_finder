part of 'my_account_cubit.dart';

@immutable
sealed class MyAccountState {}

final class MyAccountInitial extends MyAccountState {}
final class GetUserDetailLoadingState extends MyAccountState {}
final class GetUserDetailErrorState extends MyAccountState {}
final class GetUserDetailSuccessState extends MyAccountState {}
final class DeleteUserAccountLoadingState extends MyAccountState {}
final class DeleteUserAccountErrorState extends MyAccountState {}
final class DeleteUserAccountSuccessState extends MyAccountState {}
final class LogoutState extends MyAccountState {}