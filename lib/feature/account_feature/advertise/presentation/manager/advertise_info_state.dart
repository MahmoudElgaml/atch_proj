part of 'advertise_info_cubit.dart';

@immutable
abstract class AdvertiseInfoState {}

class AdvertiseInfoInitial extends AdvertiseInfoState {}
class AdvertiseAccountLoadingState extends AdvertiseInfoState {}
class AdvertiseAccountSuccessState extends AdvertiseInfoState {}
class AdvertiseAccountDeleteCampaignSuccessState extends AdvertiseInfoState {}
class AdvertiseAccountFailState extends AdvertiseInfoState {
final  String message;

  AdvertiseAccountFailState(this.message);
}

class AdvertiseAccountGetUnApproveLoadingState extends AdvertiseInfoState {}

class AdvertiseAccountGetUnApproveSuccessState extends AdvertiseInfoState {
  final CampaignModel campaignModel;

  AdvertiseAccountGetUnApproveSuccessState(this.campaignModel);
}

class AdvertiseAccountGetUnApproveFailState extends AdvertiseInfoState {
  final String message;

  AdvertiseAccountGetUnApproveFailState(this.message);
}
