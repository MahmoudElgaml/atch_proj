class UserData {
  UserData({
    this.message,
    this.person,
  });

  UserData.fromJson(dynamic json) {
    message = json['message'];
    person = json['person'] != null ? Person.fromJson(json['person']) : null;
  }

  String? message;
  Person? person;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (person != null) {
      map['person'] = person?.toJson();
    }
    return map;
  }
}

class Person {
  Person({
    this.age,
    this.about,
    this.advertiserType,
    this.email,
    this.id,
    this.name,
    this.profilePic,
    this.referralCode,
    this.role,
    this.username,
  });

  Person.fromJson(dynamic json) {
    about = json['about'];
    age=json["age"];
    advertiserType = json['advertiser_type'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    referralCode = json['referral_code'];
    role = json['role'];
    username = json['username'];
  }

  String? about;
  String? advertiserType;
  String? email;
  num? id;
  String? name;
  String? profilePic;
  dynamic referralCode;
  String? role;
  String? username;
  int?age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about'] = about;
    map['advertiser_type'] = advertiserType;
    map['email'] = email;
    map['id'] = id;
    map['name'] = name;
    map['profile_pic'] = profilePic;
    map['referral_code'] = referralCode;
    map['role'] = role;
    map['username'] = username;
    return map;
  }
}
