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
    this.advertiserLocation,
    this.image,
    this.oldImage, // Added field for old_image
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
    advertiserLocation = json['locations'] != null
        ? Map<String, dynamic>.from(json['locations'])
        : {};
    oldImage = json['old_image']; // Parse old_image from JSON
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
  Map<String, dynamic>? advertiserLocation;
  XFile? image;
  String? oldImage; // Added field for old_image

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
    map['locations'] = advertiserLocation;
    map['old_image'] = oldImage; // Add old_image to the JSON output
    return map;
  }

  FormData formData() {
    return FormData.fromMap({
      "data": jsonEncode(toJson()),
      "image": image == null
          ? null
          : MultipartFile.fromFileSync(image!.path, filename: image!.name),
    });
  }
}
