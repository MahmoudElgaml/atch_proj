part of 'get_normal_campagin_cubit.dart';

@immutable
abstract class GetNormalCampaignState {}

class GetNormalCampaignInitial extends GetNormalCampaignState {}
class GetNormalCampaignLoadingState extends GetNormalCampaignState {}
class GetNormalCampaignSuccessState extends GetNormalCampaignState {}
class GetNormalCampaignCanselRequestState extends GetNormalCampaignState {}
class GetNormalCampaignFailState extends GetNormalCampaignState {

 final  String message;

 GetNormalCampaignFailState(this.message);
}
