import 'package:atch_proj/feature/account_feature/user/data/repo/user_account_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../home_feature/data/model/CampaignModel.dart';

part 'recently_viewed_state.dart';
@injectable
class RecentlyViewedCubit extends Cubit<RecentlyViewedState> {
  RecentlyViewedCubit(this.userAccountRepo) : super(RecentlyViewedInitial());
  UserAccountRepo userAccountRepo;

  getRecentlyView() async {
    emit(RecentlyViewedLoadingState());
    var result = await userAccountRepo.getRecentlyView();
    result.fold(
      (l) {
        emit(RecentlyViewedFailState(l.message));
      },
      (campaigns) {
        emit(RecentlyViewedSuccessState(campaigns.campaigns??[]));
      },
    );
  }
}
