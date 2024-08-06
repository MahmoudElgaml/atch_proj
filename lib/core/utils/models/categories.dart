import 'package:flutter/material.dart';

enum Categories {
  sport(Color(0xffF0635A), "Sport"),
  music(Color(0xffF59762), "Music"),
  food(Color(0xff29D697), "Food");

  final String title;

  final Color color;

  const Categories(this.color, this.title);

}