part of 'overview_cubit.dart';

@immutable
sealed class OverviewState {}

final class OverviewInitial extends OverviewState {}
class OverViewsLoaded extends OverviewState {
  final List<OverView> overviews;
  OverViewsLoaded(this.overviews);
}