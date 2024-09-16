part of 'drawer_cubit.dart';

@immutable
abstract class DrawerState {}

class DrawerInitial extends DrawerState {}

class DrawerGetCampaignsSuccessState extends DrawerState {
  final List<Campaigns> allCampaigns;

  DrawerGetCampaignsSuccessState(this.allCampaigns);
}

class DrawerGetCampaignsLoadingState extends DrawerState {}

class DrawerGetCampaignsFailState extends DrawerState {
  final String message;

  DrawerGetCampaignsFailState(this.message);
}
