import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/SignData.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/SignDataTest.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  APiManger aPiManger;
  HiveManager hiveManager;

  AuthRepoImpl(this.aPiManger,this.storageToken,this.hiveManager);
StorageToken storageToken;
  @override
  Future<Either<Failure, String>> sign(SignDataTest signData) async {
    try {
      var formData = await signData.formData();

      await aPiManger.post(EndPoints.register, formData);
      return right("success");
    } catch (e) {
      if (e is DioException) {

        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserData>> logIn(
      {required String email,
      required String password,
      required String role}) async {
    try {
      var response = await aPiManger.get(EndPoints.logIn,
          body: {"email": email, "password": password, "role": role});

      UserData userData = UserData.fromJson(response.data);
      hiveManager.cacheData<Person>(boxKey: HiveKeys.userBox,dataItem: userData.person);
      storageToken.setToken(userData.person!.id.toString());


      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
