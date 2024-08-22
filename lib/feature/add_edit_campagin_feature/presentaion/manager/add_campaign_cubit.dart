import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/AddCampaignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/EditCampignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/repo/add_campaign_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'add_campaign_state.dart';

@injectable
class AddCampaignCubit extends Cubit<AddCampaignState> {
  AddCampaignCubit(this.addCampaignRepo) : super(AddCampaignInitial());
  AddCampaignRepo addCampaignRepo;
  static AddCampaignCubit get(context)=>BlocProvider.of(context);
  addCampaign(AddCampaignModel campaign) async {
    emit(AddCampaignLoadingState());
    var result = await addCampaignRepo.addCampaign(campaign);
    result.fold(
      (fail) {
        emit(AddCampaignFailState(fail.message));
      },
      (success) {
        emit(AddCampaignSuccessState());
      },
    );
  }
  editCampaign(EditCampignModel editCampaignItem)async{
    emit(AddCampaignLoadingState());
    var result = await addCampaignRepo.editCampaign(editCampaignItem);
    result.fold(
          (fail) {
        emit(AddCampaignFailState(fail.message));
      },
          (success) {
        emit(AddCampaignSuccessState());
      },
    );
  }
}
