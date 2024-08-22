part of 'get_detail_campaign_cubit.dart';

@immutable
abstract class GetDetailCampaignState {}

class GetDetailCampaignInitial extends GetDetailCampaignState {}
class GetDetailCampaignLoadingState extends GetDetailCampaignState {}
class GetDetailCampaignFailState extends GetDetailCampaignState {
  final String message ;

  GetDetailCampaignFailState(this.message);
}
class GetDetailCampaignSuccessState extends GetDetailCampaignState {}
