import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_layout_feature/data/repo/home_layout_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

@injectable
class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(this.homeLayoutRepo) : super(DrawerInitial());
  HomeLayoutRepo homeLayoutRepo;

  getAllCampaigns() async {
    emit(DrawerGetCampaignsLoadingState());
    var result = await homeLayoutRepo.getAllCampaigns();
    result.fold(
      (l) {
        emit(DrawerGetCampaignsFailState(l.message));
      },
      (r) {
        emit(DrawerGetCampaignsSuccessState(r.campaigns ?? []));
      },
    );
  }
}
