part of 'get_popular_campaign_cubit.dart';

@immutable
abstract class GetPopularCampaignState {}

class GetPopularCampaignInitial extends GetPopularCampaignState {}

class GetPopularCampaignLoadingState extends GetPopularCampaignState {}

class GetPopularCampaignSuccessState extends GetPopularCampaignState {}

class GetPopularCampaignFailureState extends GetPopularCampaignState {
  final String message;

  GetPopularCampaignFailureState(this.message);
}
