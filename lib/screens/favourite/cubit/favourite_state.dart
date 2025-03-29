part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class GetFavouriteLoadingState extends FavouriteState {}

final class GetFavouriteErrorState extends FavouriteState {}

final class GetFavouriteSuccessState extends FavouriteState {}

final class SetFavouriteLoadingState extends FavouriteState {}

final class SetFavouriteErrorState extends FavouriteState {}

final class SetFavouriteSuccessState extends FavouriteState {}
