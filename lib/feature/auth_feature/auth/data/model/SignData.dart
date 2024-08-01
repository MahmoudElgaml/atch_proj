class SignData {
  SignData({
    this.email,
    this.password,
    this.username,
    this.role,
    this.age,
    this.name,
  });

  SignData.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    role = json['role'];
    age = json['age'];
    name = json['name'];
  }

  String? email;
  String? password;
  String? username;
  String? role;
  String? age;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['username'] = username;
    map['role'] = role;
    map['age'] = age;
    map['name'] = name;
    return map;
  }
}
