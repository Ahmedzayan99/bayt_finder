part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class SetUserTypeState extends EditProfileState {}

final class SetBackupPhoneState extends EditProfileState {}

final class EditProfileCompanyErrorState extends EditProfileState {}

final class EditProfileCompanySuccessState extends EditProfileState {}

final class EditProfileCompanyLoadingState extends EditProfileState {}

final class EditProfileIndividualLoadingState extends EditProfileState {}

final class EditProfileIndividualErrorState extends EditProfileState {}

final class EditProfileIndividualSuccessState extends EditProfileState {}

final class ClearDataState extends EditProfileState {}

final class ImagePicked extends EditProfileState {}

final class GetCityLoadingState extends EditProfileState {}

final class GetCityErrorState extends EditProfileState {}

final class GetCitySuccessState extends EditProfileState {}

final class SelectPropertyState extends EditProfileState {}

final class SelectRangeValuesState extends EditProfileState {}

final class FilterConfigurationPriceLoadingState extends EditProfileState {}

final class FilterConfigurationPriceErrorState extends EditProfileState {}

final class FilterConfigurationPriceSuccessState extends EditProfileState {}

final class UpdateUserStatusLoadingState extends EditProfileState {}

final class UpdateUserStatusErrorState extends EditProfileState {}

final class UpdateUserStatusSuccessState extends EditProfileState {}
