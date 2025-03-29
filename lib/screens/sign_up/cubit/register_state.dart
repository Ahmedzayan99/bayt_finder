part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class SetUserTypeState extends RegisterState {}

final class SetBackupPhoneState extends RegisterState {}

final class RegisterCompanyErrorState extends RegisterState {}

final class RegisterCompanySuccessState extends RegisterState {}

final class RegisterCompanyLoadingState extends RegisterState {}

final class RegisterIndividualLoadingState extends RegisterState {}

final class RegisterIndividualErrorState extends RegisterState {}

final class RegisterIndividualSuccessState extends RegisterState {}

final class ClearDataState extends RegisterState {}

final class ImagePicked extends RegisterState {}

final class GetCityLoadingState extends RegisterState {}

final class GetCityErrorState extends RegisterState {}

final class GetCitySuccessState extends RegisterState {}

final class SelectPropertyState extends RegisterState {}

final class SelectRangeValuesState extends RegisterState {}

final class FilterConfigurationPriceLoadingState extends RegisterState {}

final class FilterConfigurationPriceErrorState extends RegisterState {}

final class FilterConfigurationPriceSuccessState extends RegisterState {}

final class UpdateUserStatusLoadingState extends RegisterState {}

final class UpdateUserStatusErrorState extends RegisterState {}

final class UpdateUserStatusSuccessState extends RegisterState {}
final class ClearState extends RegisterState {}
