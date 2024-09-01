import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/repo/campaign_detail_repo.dart';

part 'impression_state.dart';

@injectable
class ImpressionCubit extends Cubit<ImpressionState> {
  ImpressionCubit(this.campaignDetailRepo) : super(ImpressionInitial());
  CampaignDetailRepo campaignDetailRepo;
  static ImpressionCubit get(context)=>BlocProvider.of(context);
  linkPressed(num? campaignId, String? link) async {
    var result = await campaignDetailRepo.pressedLink(
        campaignId: campaignId, link: link);

    result.fold(
      (l) {
        emit(ImpressionFailState());
      },
      (r) {
        emit(ImpressionSuccessState());
      },
    );
  }
}
