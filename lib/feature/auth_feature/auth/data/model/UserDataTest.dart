// class UserDataTest {
//   UserDataTest({
//     this.message,
//     this.person,
//   });
//
//   UserDataTest.fromJson(dynamic json) {
//     message = json['message'];
//     person = json['person'] != null ? Person.fromJson(json['person']) : null;
//   }
//
//   String? message;
//   Person? person;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     if (person != null) {
//       map['person'] = person?.toJson();
//     }
//     return map;
//   }
// }
//
// class Person {
//   Person({
//     this.about,
//     this.advertiserType,
//     this.email,
//     this.id,
//     this.locations,
//     this.name,
//     this.profilePic,
//     this.referralCode,
//     this.role,
//     this.username,
//     this.wishlist,
//   });
//
//   Person.fromJson(dynamic json) {
//     about = json['about'];
//     advertiserType = json['advertiser_type'];
//     email = json['email'];
//     id = json['id'];
//     locations = json['locations'] != null
//         ? Locations.fromJson(json['locations'])
//         : null;
//     name = json['name'];
//     profilePic = json['profile_pic'];
//     referralCode = json['referral_code'];
//     role = json['role'];
//     username = json['username'];
//     if (json['wishlist'] != null) {
//       wishlist = [];
//       json['wishlist'].forEach((v) {
//         wishlist?.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//
//   String? about;
//   String? advertiserType;
//   String? email;
//   num? id;
//   Locations? locations;
//   String? name;
//   String? profilePic;
//   String? referralCode;
//   String? role;
//   String? username;
//   List<dynamic>? wishlist;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['about'] = about;
//     map['advertiser_type'] = advertiserType;
//     map['email'] = email;
//     map['id'] = id;
//     if (locations != null) {
//       map['locations'] = locations?.toJson();
//     }
//     map['name'] = name;
//     map['profile_pic'] = profilePic;
//     map['referral_code'] = referralCode;
//     map['role'] = role;
//     map['username'] = username;
//     if (wishlist != null) {
//       map['wishlist'] = wishlist?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
//
//
