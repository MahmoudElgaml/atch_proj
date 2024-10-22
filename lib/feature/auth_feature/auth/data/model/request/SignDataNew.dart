import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SignDataNew {
  SignDataNew({
    this.email,
    this.password,
    this.name,
    this.role,
    this.referralCode,
    this.about,
    this.visa,
    this.username,
    this.advertiserType,
    this.age,
    this.advertiserPhones,
    this.locations,
  });

  SignDataNew.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    referralCode = json['referral_code'];
    about = json['about'];
    visa = json['visa'];
    username = json['username'];
    advertiserType = json['advertiser_type'];
    advertiserPhones = json['advertiser_phones'] != null
        ? json['advertiser_phones'].cast<String>()
        : [];
    locations = json['locations'] != null
        ? Locations.fromJson(json['locations'])
        : null;
  }

  String? email;
  String? password;
  String? name;
  String? role;
  bool? referralCode;
  String? about;
  String? visa;
  String? username;
  String? age;
  String? advertiserType;
  List<String>? advertiserPhones;
  Locations? locations;
  XFile? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['role'] = role;
    map['referral_code'] = referralCode;
    map['about'] = about;
    map['visa'] = visa;
    map['username'] = username;
    map['age'] = age;
    map['advertiser_type'] = advertiserType;
    map['advertiser_phones'] = advertiserPhones;
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }
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

class Locations {
  Locations({
    this.location1,
    this.location2,
  });

  Locations.fromJson(dynamic json) {
    location1 = json['location1'] != null
        ? Location1.fromJson(json['location1'])
        : null;
    location2 = json['location2'] != null
        ? Location2.fromJson(json['location2'])
        : null;
  }

  Location1? location1;
  Location2? location2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location1 != null) {
      map['location1'] = location1?.toJson();
    }
    if (location2 != null) {
      map['location2'] = location2?.toJson();
    }
    return map;
  }
}

class Location2 {
  Location2({
    this.name,
    this.link,
    this.lat,
    this.lng,
  });

  Location2.fromJson(dynamic json) {
    name = json['name'];
    link = json['link'];
    lat = json['lat'];
    lng = json['lng'];
  }

  String? name;
  String? link;
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['link'] = link;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}

class Location1 {
  Location1({
    this.name,
    this.link,
    this.lat,
    this.lng,
  });

  Location1.fromJson(dynamic json) {
    name = json['name'];
    link = json['link'];
    lat = json['lat'];
    lng = json['lng'];
  }

  String? name;
  String? link;
  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['link'] = link;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
