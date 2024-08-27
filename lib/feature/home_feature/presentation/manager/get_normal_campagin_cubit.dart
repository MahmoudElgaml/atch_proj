import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/CampaignModel.dart';
import '../../data/repo/home_repo.dart';

part 'get_normal_campagin_state.dart';

@injectable
class GetNormalCampaignCubit extends Cubit<GetNormalCampaignState> {
  GetNormalCampaignCubit(this.homeRepo) : super(GetNormalCampaignInitial());
  HomeRepo homeRepo;

  static GetNormalCampaignCubit get(context) => BlocProvider.of(context);

  @override
  void emit(GetNormalCampaignState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  List<Campaigns> popularCampaign = [];

  getNormalCampaign(String advType) async {
    emit(GetNormalCampaignLoadingState());
    var result = await homeRepo.getNormalCampaign(advType);
    result.fold(
      (fail) {
        if (fail.statusCode == "1") {
          emit(GetNormalCampaignCanselRequestState());
        } else {
          emit(GetNormalCampaignFailState(fail.message));
        }
      },
      (success) {
        popularCampaign = success.campaigns ?? [];

        emit(GetNormalCampaignSuccessState());
      },
    );
  }
}
