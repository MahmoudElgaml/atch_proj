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
class Person extends HiveObject {
  Person({
    this.age,
    this.about,
    this.advertiserType,
    this.email,
    this.id,
    this.locations,
    this.name,
    this.profilePic,
    this.referralCode,
    this.role,
    this.username,
    this.wishlist,
  });

  Person.fromJson(dynamic json) {
    about = json['about'];
    age = json['age'];
    advertiserType = json['advertiser_type'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    referralCode = json['referral_code'];
    role = json['role'];
    username = json['username'];
    wishlist = json['wishlist'] != null ? json['wishlist'].cast<num>() : [];
    locations = json['locations'] != null
        ? Locations.fromJson(json['locations'])
        : null;
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
  @HiveField(11)
  List<num>? wishlist;
  @HiveField(12)
  Locations? locations;

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
    map['wishlist'] = wishlist;
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }
    return map;
  }
}

@HiveType(typeId: 2)
class Locations {
  Locations({
    this.location0,
    this.location1,
  });

  Locations.fromJson(dynamic json) {
    location0 = json['location0'] != null
        ? Location0.fromJson(json['location0'])
        : null;
    location1 = json['location1'] != null
        ? Location1.fromJson(json['location1'])
        : null;
  }

  @HiveField(1)
  Location0? location0;
  @HiveField(2)
  Location1? location1;

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

@HiveType(typeId: 3)
class Location1 extends Locations {
  Location1({
    this.lat,
    this.link,
    this.lng,
    this.name,
  });

  Location1.fromJson(dynamic json) {
    lat = json['lat'];
    link = json['link'];
    lng = json['lng'];
    name = json['name'];
  }

  @HiveField(1)
  num? lat;
  @HiveField(2)
  String? link;
  @HiveField(3)
  num? lng;
  @HiveField(4)
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

@HiveType(typeId: 4)
class Location0 extends Locations {
  Location0({
    this.lat,
    this.link,
    this.lng,
    this.name,
  });

  Location0.fromJson(dynamic json) {
    lat = json['lat'];
    link = json['link'];
    lng = json['lng'];
    name = json['name'];
  }

  @HiveField(1)
  num? lat;
  @HiveField(2)
  String? link;
  @HiveField(3)
  num? lng;
  @HiveField(4)
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
