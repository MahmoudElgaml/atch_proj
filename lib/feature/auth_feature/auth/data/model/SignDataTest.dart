import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class SignDataTest {
  SignDataTest({
    this.contactEmail,
    this.password,
    this.companyName,
    this.role,
    this.referralCode,
    this.about,
    this.visa,
    this.advertiserName,
    this.advertiserType,
    this.advertiserPhones,
    this.advertiserLocation,
  });

  SignDataTest.fromJson(dynamic json) {
    contactEmail = json['contact_email'];
    password = json['password'];
    companyName = json['company_name'];
    role = json['role'];
    referralCode = json['referral_code'];
    about = json['about'];
    visa = json['visa'];
    advertiserName = json['advertiser_name'];
    advertiserType = json['advertiser_type'];
    advertiserPhones = json['advertiser_phones'] != null
        ? json['advertiser_phones'].cast<String>()
        : [];
    advertiserLocation = json['advertiser_location'] != null
        ? json['advertiser_location'].cast<String>()
        : [];
  }

  String? contactEmail;
  String? password;
  String? companyName;
  String? role;
  num? referralCode;
  String? about;
  String? visa;
  String? advertiserName;
  String? advertiserType;
  List<String>? advertiserPhones;
  List<String>? advertiserLocation;
  XFile? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contact_email'] = contactEmail;
    map['password'] = password;
    map['company_name'] = companyName;
    map['role'] = role;
    map['referral_code'] = referralCode;
    map['about'] = about;
    map['visa'] = visa;
    map['advertiser_name'] = advertiserName;
    map['advertiser_type'] = advertiserType;
    map['advertiser_phones'] = advertiserPhones;
    map['advertiser_location'] = advertiserLocation;
    return map;
  }

  formData() async{
    FormData.fromMap({
      "data": toJson(),
      "image": await MultipartFile.fromFile(image!.path, filename: image!.name)
    });
  }
}
