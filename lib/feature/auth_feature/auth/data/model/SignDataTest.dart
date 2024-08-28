import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SignDataTest {
  SignDataTest({
    this.email,
    this.password,
    this.name,
    this.age,
    this.role,
    this.referralCode,
    this.about,
    this.visa,
    this.username,
    this.advertiserType,
    this.advertiserPhones,
    this.advertiserLocation,
  });

  SignDataTest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    age = json['age'];
    role = json['role'];
    referralCode = json['referral_code'];
    about = json['about'];
    visa = json['visa'];
    username = json['username'];
    advertiserType = json['advertiser_type'];
    advertiserPhones = json['advertiser_phones'] != null
        ? json['advertiser_phones'].cast<String>()
        : [];
    advertiserLocation = json['advertiser_location'] != null
        ? json['advertiser_location'].cast<String>()
        : [];
  }

  String? email;
  String? password;
  String? name;
  String? age;
  String? role;
  bool? referralCode;
  String? about;
  String? visa;
  String? username;
  String? advertiserType;
  List<String>? advertiserPhones;
  List<String>? advertiserLocation;
  XFile? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['age'] = age;
    map['role'] = role;
    map['referral_code'] = referralCode;
    map['about'] = about;
    map['visa'] = visa;
    map['username'] = username;
    map['advertiser_type'] = advertiserType;
    map['advertiser_phones'] = advertiserPhones;
    map['advertiser_location'] = advertiserLocation;
    return map;
  }

  Future<FormData> formData() async {
    return FormData.fromMap({
      "data": jsonEncode(toJson()),
      "image": image == null
          ? null
          : await MultipartFile.fromFile(image!.path, filename: image!.name)
    });
  }
}
