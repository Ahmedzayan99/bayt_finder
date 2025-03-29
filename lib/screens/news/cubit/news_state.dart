part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class GetNewsAllLoadingState extends NewsState {}

final class GetNewsAllErrorState extends NewsState {}

final class GetNewsAllSuccessState extends NewsState {}