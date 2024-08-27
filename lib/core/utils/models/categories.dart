import 'package:flutter/material.dart';

enum Categories {
  Factory("Factory"),
  Shop("Shop"),
  Supermarket("Supermarket"),
  Fashion("Fashion"),
  HealthBeauty("Health & Beauty"),
  BabyProducts("Baby Products"),
  phone("Phones & Tablets"),
  Furniture("Home & Furniture"),
  Appliances("Appliances"),
  TelevisionsAudio("Televisions & Audio"),
  Computing("Computing"),
  SportingGoods("Sporting Goods"),
  Gaming("Gaming"),
  Othercategories("Other categories");

  final String title;

  const Categories(this.title);
}
