import 'package:atch_proj/feature/advertiser_info_feature/data/repo/adv_info_repo.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'adv_info_state.dart';

@injectable
class AdvInfoCubit extends Cubit<AdvInfoState> {
  AdvInfoCubit(this.advInfoRepo) : super(AdvInfoInitial());
  AdvInfoRepo advInfoRepo;
  List<Campaigns> advCampaigns = [];

  static AdvInfoCubit get(context) => BlocProvider.of(context);

  getAdvCampaigns(num? advId) async {
    emit(AdvInfoLoadingState());
    var result = await advInfoRepo.gerAdvCampaign(advId);
    result.fold(
      (fail) {
        emit(AdvInfoFailState(fail.message));
      },
      (campaigns) {
        advCampaigns = campaigns.campaigns ?? [];
        if (advCampaigns.isEmpty) {
          emit(AdvInfoEmptyState());
        } else {
          emit(AdvInfoSuccessState());
        }
      },
    );
  }


}
