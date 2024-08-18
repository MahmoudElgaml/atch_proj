import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class EditUserData {
  EditUserData({
    this.email,
    this.password,
    this.username,
    this.age,
    this.name,
    this.userId,
    this.image,
  });

  EditUserData.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    age = json['age'];
    name = json['name'];
    userId = json['user_id'];
  }

  String? email;
  String? password;
  String? username;
  String? age;
  String? name;
  num? userId;
  XFile? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['username'] = username;
    map['age'] = age;
    map['name'] = name;
    map['user_id'] = userId;
    return map;
  }

  FormData formData() {
    return FormData.fromMap({
      "data": jsonEncode(toJson()),
      "image": image == null
          ? null
          : MultipartFile.fromFileSync(image!.path, filename: image!.name)
    });
  }
}
