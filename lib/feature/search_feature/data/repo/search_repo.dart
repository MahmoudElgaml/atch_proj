import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/search_feature/data/model/SearchItemModel.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,SearchItemModel>> search(String searchWord);



}