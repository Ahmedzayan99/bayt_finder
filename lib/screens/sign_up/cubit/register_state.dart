part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class ActiveButtonState extends RegisterState {}
final class GenderSelectState extends RegisterState {}
final class RegisterUserLoadingState extends RegisterState {}
final class RegisterUserErrorState extends RegisterState {}
final class RegisterUserSuccessState extends RegisterState {}

final class GetCityLoadingState extends RegisterState {}
final class GetCityErrorState extends RegisterState {}
final class GetCitySuccessState extends RegisterState {}
final class ClearDataState extends RegisterState {}
final class SelectPropertyState extends RegisterState {}
final class SelectRangeValuesState extends RegisterState {}
final class FilterConfigurationPriceLoadingState extends RegisterState {}
final class FilterConfigurationPriceErrorState extends RegisterState {}
final class FilterConfigurationPriceSuccessState extends RegisterState {}
final class UpdateUserStatusLoadingState extends RegisterState {}
final class UpdateUserStatusErrorState extends RegisterState {}
final class UpdateUserStatusSuccessState extends RegisterState {}
