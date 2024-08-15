import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/AddCampaignModel.dart';
import 'package:dartz/dartz.dart';

abstract class AddCampaignRepo {
  Future<Either<Failure, String>> addCampaign(AddCampaignModel addCampaignModel);
}
