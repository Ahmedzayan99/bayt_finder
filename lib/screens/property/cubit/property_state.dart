part of 'property_cubit.dart';

@immutable
sealed class PropertyState {}

final class PropertyInitial extends PropertyState {}
final class FilterPropertyLoadingState extends PropertyState {}
final class FilterPropertyErrorState extends PropertyState {}
final class FilterPropertySuccessState extends PropertyState {}
final class PropertyDetailLoadingState extends PropertyState {}
final class PropertyDetailErrorState extends PropertyState {}
final class PropertyDetailSuccessState extends PropertyState {}
