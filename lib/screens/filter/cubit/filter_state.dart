part of 'filter_cubit.dart';

@immutable
sealed class FilterState {}

final class FilterInitial extends FilterState {}
final class SetState extends FilterState {}
final class SearchLocationLoadingState extends FilterState {}
final class SearchLocationErrorState extends FilterState {}
final class SearchLocationSuccessState extends FilterState {}

final class FilterConfigurationPriceLoadingState extends FilterState {}

final class FilterConfigurationPriceErrorState extends FilterState {}

final class FilterConfigurationPriceSuccessState extends FilterState {}
final class GetCityLoadingState extends FilterState {}

final class GetCityErrorState extends FilterState {}

final class GetCitySuccessState extends FilterState {}
final class FilterPropertyLoadingState extends FilterState {}
final class FilterPropertyErrorState extends FilterState {}
final class FilterPropertySuccessState extends FilterState {}
final class GetCategoryLoadingState extends FilterState {}
final class GetCategoryErrorState extends FilterState {}
final class GetCategorySuccessState extends FilterState {}