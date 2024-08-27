part of 'qr_offer_cubit.dart';

@immutable
abstract class QrOfferState {}

class QrOfferInitial extends QrOfferState {}
class QrOfferCheckLoadingState extends QrOfferState {}
class QrOfferCheckSuccessState extends QrOfferState {}
class QrOfferCheckFailState extends QrOfferState {
 final  String message;

  QrOfferCheckFailState(this.message);
}
