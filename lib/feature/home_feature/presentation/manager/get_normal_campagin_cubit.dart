import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/CampaignModel.dart';
import '../../data/repo/home_repo.dart';

part 'get_normal_campagin_state.dart';
@injectable
class GetNormalCampaginCubit extends Cubit<GetNormalCampaginState> {
  GetNormalCampaginCubit(this.homeRepo) : super(GetNormalCampaginInitial());
  HomeRepo homeRepo;
  static  GetNormalCampaginCubit get(context)=>BlocProvider.of(context);
  @override
  void emit(GetNormalCampaginState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
  List<Campaigns> popularCampaign=[];
  getNormalCampaign() async {
    emit(GetNormalCampaginLoadingState());
    var result = await homeRepo.getNormalCampaign();
    result.fold(
          (fail) {
        emit(GetNormalCampaginFailState(fail.message));

      },
          (success) {
        popularCampaign=success.campaigns??[];

        emit(GetNormalCampaginSuccessState());



      },
    );
  }
}
