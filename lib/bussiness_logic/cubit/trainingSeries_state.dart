part of 'trainingSeries_cubit.dart';

@immutable
sealed class trainingSeriesState {}

final class ChatectersInitial extends trainingSeriesState {}

class trainingSeriesLoaded extends trainingSeriesState {
  final List<trainingSeries> series;
  trainingSeriesLoaded(this.series);
}
