import 'package:atch_proj/feature/account_feature/user/data/repo/user_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../home_feature/data/model/CampaignModel.dart';

part 'used_offer_state.dart';
@injectable
class UsedOfferCubit extends Cubit<UsedOfferState> {
  UsedOfferCubit(this.userAccountRepo) : super(UsedOfferInitial());
  UserAccountRepo userAccountRepo;
   getUsedOffer() async {
    emit(UsedOfferLoadingState());
    var result = await userAccountRepo.getUsedOffer();
    result.fold(
          (l) {
        emit(UsedOfferFailState(l.message));
      },
          (campaigns) {
        emit(UsedOfferSuccessState(campaigns.campaigns??[]));
      },
    );
  }

}
