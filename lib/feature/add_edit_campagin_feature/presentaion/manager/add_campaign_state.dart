part of 'add_campaign_cubit.dart';

@immutable
abstract class AddCampaignState {}

class AddCampaignInitial extends AddCampaignState {}
class AddCampaignLoadingState extends AddCampaignState {}
class AddCampaignSuccessState extends AddCampaignState {}
class AddCampaignFailState extends AddCampaignState {
  final String message;
  AddCampaignFailState(this.message);

}
