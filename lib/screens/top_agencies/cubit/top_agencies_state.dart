part of 'top_agencies_cubit.dart';

@immutable
sealed class TopAgenciesState {}

final class TopAgenciesInitial extends TopAgenciesState {}
final class GetAgenciesLoadingState extends TopAgenciesState {}
final class GetAgenciesErrorState extends TopAgenciesState {}
final class GetAgenciesSuccessState extends TopAgenciesState {}
