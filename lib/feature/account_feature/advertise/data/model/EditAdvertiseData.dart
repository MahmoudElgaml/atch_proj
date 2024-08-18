import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class EditAdvertiseData {
  EditAdvertiseData({
    this.contactEmail,
    this.advertiserId,
    this.about,
    this.password,
    this.companyName,
    this.visa,
    this.advertiserName,
    this.advertiserType,
    this.advertiserPhones,
    this.advertiserLocations,
    this.image
  });

  EditAdvertiseData.fromJson(dynamic json) {
    contactEmail = json['contact_email'];
    advertiserId = json['advertiser_id'];
    about = json['about'];
    password = json['password'];
    companyName = json['company_name'];
    visa = json['visa'];
    advertiserName = json['advertiser_name'];
    advertiserType = json['advertiser_type'];
    advertiserPhones = json['advertiser_phones'] != null
        ? json['advertiser_phones'].cast<String>()
        : [];
    advertiserLocations = json['advertiser_locations'] != null
        ? json['advertiser_locations'].cast<String>()
        : [];
  }

  String? contactEmail;
  num? advertiserId;
  String? about;
  String? password;
  String? companyName;
  String? visa;
  String? advertiserName;
  String? advertiserType;
  List<String>? advertiserPhones;
  List<String>? advertiserLocations;
  XFile? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contact_email'] = contactEmail;
    map['advertiser_id'] = advertiserId;
    map['about'] = about;
    map['password'] = password;
    map['company_name'] = companyName;
    map['visa'] = visa;
    map['advertiser_name'] = advertiserName;
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
