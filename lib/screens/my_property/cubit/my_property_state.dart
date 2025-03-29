part of 'my_property_cubit.dart';

@immutable
sealed class MyPropertyState {}

final class MyPropertyInitial extends MyPropertyState {}
final class GetMyPropertyLoadingState extends MyPropertyState {}

final class GetMyPropertyErrorState extends MyPropertyState {}

final class GetMyPropertySuccessState extends MyPropertyState {}
final class GetCategoryLoadingState extends MyPropertyState {}
final class GetCategoryErrorState extends MyPropertyState {}
final class GetCategorySuccessState extends MyPropertyState {}
final class ChangeCategoryState extends MyPropertyState {}
final class ImagePicked extends MyPropertyState {}
final class UpdateCheckBoxData extends MyPropertyState {}
final class SavePropertyLoadingState extends MyPropertyState {}
final class SavePropertyErrorState extends MyPropertyState {}

final class PropertyDeleteSuccessState extends MyPropertyState {}
final class PropertyDeleteLoadingState extends MyPropertyState {}
final class PropertyDeleteErrorState extends MyPropertyState {}

final class SavePropertySuccessState extends MyPropertyState {}
final class SetUpdatePropertyData extends MyPropertyState {}