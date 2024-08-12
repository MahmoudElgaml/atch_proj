import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/search_feature/data/model/SearchItemModel.dart';
import 'package:atch_proj/feature/search_feature/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  APiManger aPiManger;

  SearchRepoImpl(this.aPiManger);

  @override
  Future<Either<Failure, SearchItemModel>> search(String searchWord) async {
    try {
      var response = await aPiManger.post(
        EndPoints.search,
        {
          "search": searchWord,
        },
      );
      SearchItemModel searchItemModel = SearchItemModel.fromJson(response.data);
      return right(searchItemModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
