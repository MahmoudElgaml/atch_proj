import 'package:hive/hive.dart';
part 'UserData.g.dart';
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

@HiveType(typeId: 1)
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
    age = json["age"];
    advertiserType = json['advertiser_type'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    referralCode = json['referral_code'];
    role = json['role'];
    username = json['username'];
  }

  @HiveField(1)
  String? about;
  @HiveField(2)
  String? advertiserType;
  @HiveField(3)
  String? email;
  @HiveField(4)
  num? id;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? profilePic;
  @HiveField(7)
  dynamic referralCode;
  @HiveField(8)
  String? role;
  @HiveField(9)
  String? username;
  @HiveField(10)
  int? age;

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
