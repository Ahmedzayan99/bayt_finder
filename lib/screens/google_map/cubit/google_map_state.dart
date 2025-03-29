part of 'google_map_cubit.dart';

@immutable
sealed class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}
final class PropertyDetailLoadingState extends GoogleMapState {}
final class PropertyDetailErrorState extends GoogleMapState {}
final class PropertyDetailSuccessState extends GoogleMapState {}
final class OnMapCreatedSelect extends GoogleMapState {}
final class CurrentLocation extends GoogleMapState {}
final class AddMarker extends GoogleMapState {}
final class OnMapMove extends GoogleMapState {}
final class OnCameraIdle extends GoogleMapState {}
final class AddData extends GoogleMapState {}
final class AddDataLoading extends GoogleMapState {}
