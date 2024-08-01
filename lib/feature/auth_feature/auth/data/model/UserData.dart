class UserData {
  UserData({
    this.message,
    this.user,
  });

  UserData.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.age,
    this.email,
    this.id,
    this.name,
    this.password,
    this.profilePic,
    this.username,
  });

  User.fromJson(dynamic json) {
    age = json['age'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    password = json['password'];
    profilePic = json['profile_pic'];
    username = json['username'];
  }

  num? age;
  String? email;
  num? id;
  String? name;
  String? password;
  dynamic profilePic;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['age'] = age;
    map['email'] = email;
    map['id'] = id;
    map['name'] = name;
    map['password'] = password;
    map['profile_pic'] = profilePic;
    map['username'] = username;
    return map;
  }
}
