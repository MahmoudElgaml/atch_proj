import 'package:atch_proj/feature/qr_offer_feature/data/repo/qr_offer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'qr_offer_state.dart';

@injectable
class QrOfferCubit extends Cubit<QrOfferState> {
  QrOfferRepo qrOfferRepo;

  QrOfferCubit(this.qrOfferRepo) : super(QrOfferInitial());

  static QrOfferCubit get(context) => BlocProvider.of(context);

  checkOfferValidate(num? campaignId) async {
    emit(QrOfferCheckLoadingState());
    var result = await qrOfferRepo.checkOfferValidate(campaignId);
    result.fold(
      (l) {
        emit(QrOfferCheckFailState(l.message));
      },
      (r) {
        emit(QrOfferCheckSuccessState());
      },
    );
  }

  takeOffer({required num? campaignId, required num? advId}) async {
    emit(QrOfferTakeLoadingState());
    var result =
        await qrOfferRepo.takeOffer(advId: advId, campaignId: campaignId);
    result.fold(
      (l) {
        emit(QrOfferTakeFailState(l.message));
      },
      (r) {
        emit(QrOfferTakeSuccessState(r));
      },
    );
  }
}
