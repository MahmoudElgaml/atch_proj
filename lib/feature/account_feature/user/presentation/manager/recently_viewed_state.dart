part of 'recently_viewed_cubit.dart';

@immutable
abstract class RecentlyViewedState {}

class RecentlyViewedInitial extends RecentlyViewedState {}
class RecentlyViewedLoadingState extends RecentlyViewedState {}
class RecentlyViewedSuccessState extends RecentlyViewedState {
 final  List<Campaigns> campaigns;

 RecentlyViewedSuccessState(this.campaigns);
}
class RecentlyViewedFailState extends RecentlyViewedState {
  final String message;

  RecentlyViewedFailState(this.message);
}
