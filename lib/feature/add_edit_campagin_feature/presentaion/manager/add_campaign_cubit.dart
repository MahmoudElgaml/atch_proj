import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/AddCampaignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/EditCampignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/repo/add_campaign_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/helper.dart';

part 'add_campaign_state.dart';

@injectable
class AddCampaignCubit extends Cubit<AddCampaignState> {
  AddCampaignCubit(this.addCampaignRepo) : super(AddCampaignInitial());
  AddCampaignRepo addCampaignRepo;
  String selectedAudience = "Babies";
  String selectedLocation =
      Helper.retrievePerson()?.locations?.keys.first ?? "";
  static AddCampaignCubit get(context) => BlocProvider.of(context);

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

  editCampaign(EditCampignModel editCampaignItem) async {
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

  validateOfferUponPrice({required String price, required String offer}) {
    print(price);
    print(offer);
    if (price != "" && offer != "") {
      int thePrice = int.parse(price);
      int theOffer = int.parse(offer);

      if (theOffer >= thePrice) {
        return "Offer must be lower than price";
      } else {
        return null;
      }
    }
  }
}
