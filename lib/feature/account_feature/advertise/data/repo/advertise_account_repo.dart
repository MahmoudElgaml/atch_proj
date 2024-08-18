import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/EditAdvertiseData.dart';
import 'package:dartz/dartz.dart';

abstract class AdvertiseAccountRepo{
 Future<Either<Failure,AdvertiseInfo>> getAdvertiseInfo();
 Future<Either<Failure,String>> editAdvertise(EditAdvertiseData advertiseData);


}