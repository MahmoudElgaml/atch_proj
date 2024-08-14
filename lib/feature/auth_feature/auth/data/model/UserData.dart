class UserData {
  UserData({
    this.message,
    this.user,
  });

  UserData.fromJson(dynamic json) {
    message = json['message'];
    user = json['person'] != null
        ? UserInformation.fromJson(json['person'])
        : null;
  }

  String? message;
  UserInformation? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['person'] = user?.toJson();
    }
    return map;
  }
}

class UserInformation {
  UserInformation({
    this.about,
    this.advertiserName,
    this.advertiserPic,
    this.advertiserType,
    this.companyName,
    this.email,
    this.id,
    this.password,
    this.referralCode,
    this.visaNumber,
  });

  UserInformation.fromJson(dynamic json) {
    about = json['about'];
    advertiserName = json['advertiser_name'];
    advertiserPic = json['advertiser_pic'];
    advertiserType = json['advertiser_type'];
    companyName = json['company_name'];
    email = json['contact_email'];
    id = json['id'];
    password = json['password'];
    referralCode = json['referral_code'];
    visaNumber = json['visa_number'];
  }

  String? about;
  String? advertiserName;
  String? advertiserPic;
  String? advertiserType;
  String? companyName;
  String? email;
  num? id;
  String? password;
  String? referralCode;
  String? visaNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about'] = about;
    map['advertiser_name'] = advertiserName;
    map['advertiser_pic'] = advertiserPic;
    map['advertiser_type'] = advertiserType;
    map['company_name'] = companyName;
    map['contact_email'] = email;
    map['id'] = id;
    map['password'] = password;
    map['referral_code'] = referralCode;
    map['visa_number'] = visaNumber;
    return map;
  }
}
