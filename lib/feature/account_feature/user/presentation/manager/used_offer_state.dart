part of 'used_offer_cubit.dart';

abstract class UsedOfferState {}

class UsedOfferInitial extends UsedOfferState {}
class UsedOfferLoadingState extends UsedOfferState {}

class UsedOfferSuccessState extends UsedOfferState {
  final  List<Campaigns> campaigns;

  UsedOfferSuccessState(this.campaigns);
}
class UsedOfferFailState extends UsedOfferState {
  final String message;

  UsedOfferFailState(this.message);
}