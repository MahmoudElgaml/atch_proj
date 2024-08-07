import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'get_popular_campaign_state.dart';
@injectable
class GetPopularCampaignCubit extends Cubit<GetPopularCampaignState> {
  GetPopularCampaignCubit(this.homeRepo) : super(GetPopularCampaignInitial());
  HomeRepo homeRepo;
  static  GetPopularCampaignCubit get(context)=>BlocProvider.of(context);

  List<Campaigns> popularCampaign=[];
  getPopularCampaign() async {
    emit(GetPopularCampaignLoadingState());
    var result = await homeRepo.getPopularCampaign();
    result.fold(
      (fail) {
        emit(GetPopularCampaignFailureState(fail.message));

      },
      (success) {
        popularCampaign=success.campaigns??[];
        emit(GetPopularCampaignSuccessState());



      },
    );
  }
}
