part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class GetUserDetailLoadingState extends HomeState {}
final class GetUserDetailErrorState extends HomeState {}
final class GetUserDetailSuccessState extends HomeState {}
final class GetCategoryLoadingState extends HomeState {}
final class GetCategoryErrorState extends HomeState {}
final class GetCategorySuccessState extends HomeState {}
final class InitLocationStreamLoading extends HomeState {}
final class InitLocationStreamError extends HomeState {}
final class InitLocationStreamSuccess extends HomeState {}
