import 'dart:async';

import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/SignData.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/SignDataTest.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo{
  Future<Either<Failure,String>> sign(SignDataTest signData);
  Future<Either<Failure,UserData>> logIn({required String email, required String password,required String role});


}