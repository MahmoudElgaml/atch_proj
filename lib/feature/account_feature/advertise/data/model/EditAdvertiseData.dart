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
    this.locations,
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
    locations = json['locations'] != null
        ? LocationsForEdit.fromJson(json['locations'])
        : null;
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

  // change to new location type
  LocationsForEdit? locations;
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
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }
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
// new locations Type
class LocationsForEdit {
  LocationsForEdit({
    this.location0,
    this.location1,
  });

  LocationsForEdit.fromJson(dynamic json) {
    location0 = json['location0'] != null
        ? Location0ForEdit.fromJson(json['location0'])
        : null;
    location1 = json['location1'] != null
        ? Location1ForEdit.fromJson(json['location1'])
        : null;
  }

  Location0ForEdit? location0;
  Location1ForEdit? location1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location0 != null) {
      map['location0'] = location0?.toJson();
    }
    if (location1 != null) {
      map['location1'] = location1?.toJson();
    }
    return map;
  }
}

class Location1ForEdit {
  Location1ForEdit({
    this.lat,
    this.link,
    this.lng,
    this.name,
  });

  Location1ForEdit.fromJson(dynamic json) {
    lat = json['lat'];
    link = json['link'];
    lng = json['lng'];
    name = json['name'];
  }

  num? lat;
  String? link;
  num? lng;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['link'] = link;
    map['lng'] = lng;
    map['name'] = name;
    return map;
  }
}

class Location0ForEdit {
  Location0ForEdit({
    this.lat,
    this.link,
    this.lng,
    this.name,
  });

  Location0ForEdit.fromJson(dynamic json) {
    lat = json['lat'];
    link = json['link'];
    lng = json['lng'];
    name = json['name'];
  }

  num? lat;
  String? link;
  num? lng;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['link'] = link;
    map['lng'] = lng;
    map['name'] = name;
    return map;
  }
}
