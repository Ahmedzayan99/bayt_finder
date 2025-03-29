part of 'show_property_in_map_cubit.dart';

@immutable
sealed class ShowPropertyInMapState {}

final class ShowPropertyInMapInitial extends ShowPropertyInMapState {}
final class AddMarker extends ShowPropertyInMapState {}
final class CurrentLocation extends ShowPropertyInMapState {}
final class PropertyDetailLoadingState extends ShowPropertyInMapState {}
final class PropertyDetailErrorState extends ShowPropertyInMapState {}
final class PropertyDetailSuccessState extends ShowPropertyInMapState {}
final class ChengeMapType extends ShowPropertyInMapState {}
