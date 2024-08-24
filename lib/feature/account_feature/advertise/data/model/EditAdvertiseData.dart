import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class EditAdvertiseData {
  EditAdvertiseData({
    this.email,
    this.advertiserId,
    this.about,
    this.password,
    this.name,
    this.visa,
    this.username,
    this.advertiserType,
    this.advertiserPhones,
    this.advertiserLocations,
  });

  EditAdvertiseData.fromJson(dynamic json) {
    email = json['email'];
    advertiserId = json['advertiser_id'];
    about = json['about'];
    password = json['password'];
    name = json['name'];
    visa = json['visa'];
    username = json['username'];
    advertiserType = json['advertiser_type'];
    advertiserPhones = json['advertiser_phones'] != null
        ? json['advertiser_phones'].cast<String>()
        : [];
    advertiserLocations = json['advertiser_locations'] != null
        ? json['advertiser_locations'].cast<String>()
        : [];
  }

  String? email;
  num? advertiserId;
  String? about;
  String? password;
  String? name;
  String? visa;
  String? username;
  String? advertiserType;
  List<String>? advertiserPhones;
  List<String>? advertiserLocations;
  XFile? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['advertiser_id'] = advertiserId;
    map['about'] = about;
    map['password'] = password;
    map['name'] = name;
    map['visa'] = visa;
    map['username'] = username;
    map['advertiser_type'] = advertiserType;
    map['advertiser_phones'] = advertiserPhones;
    map['advertiser_locations'] = advertiserLocations;
    return map;
  }
  FormData formData() {
    return FormData.fromMap({
      "data": jsonEncode(toJson()),
      "image": image == null
          ? null
          : MultipartFile.fromFileSync(image!.path, filename: image!.name)
    });
  }
}


