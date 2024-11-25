import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../auth_feature/auth/data/model/UserData.dart';

class EditCampignModel {
  EditCampignModel({
    this.campaignId,
    this.campaignName,
    this.campaignDescription,
    this.campaignStartDate, // New field
    this.campaignEndDate,
    this.campaignPrice,
    this.campaignOffer,
    this.campaignVideos,
    this.locations,
    this.oldCampaignImages,
    this.images,
  });

  EditCampignModel.fromJson(dynamic json) {
    campaignId = json['campaign_id'];
    campaignName = json['campaign_name'];
    campaignDescription = json['campaign_description'];
    campaignStartDate = json['campaign_start_date']; // New field
    campaignEndDate = json['campaign_end_date'];
    campaignPrice = json['campaign_price'];
    campaignOffer = json['campaign_offer'];
    campaignVideos = json['campaign_videos'] != null
        ? json['campaign_videos'].cast<String>()
        : [];
    locations = json['locations'] != null
        ? UserLocations.fromJson(json['locations'])
        : null;
    oldCampaignImages = json['old_campaign_images'] != null
        ? json['old_campaign_images'].cast<String>()
        : [];
  }

  num? campaignId;
  String? campaignName;
  String? campaignDescription;
  String? campaignStartDate; // New field
  String? campaignEndDate;
  num? campaignPrice;
  num? campaignOffer;
  List<String>? campaignVideos;
  UserLocations? locations;
  List<String>? oldCampaignImages;
  List<XFile>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['campaign_id'] = campaignId;
    map['campaign_name'] = campaignName;
    map['campaign_description'] = campaignDescription;
    map['campaign_start_date'] = campaignStartDate; // New field
    map['campaign_end_date'] = campaignEndDate;
    map['campaign_price'] = campaignPrice;
    map['campaign_offer'] = campaignOffer;
    map['campaign_videos'] = campaignVideos;
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }
    map['old_campaign_images'] = oldCampaignImages;
    return map;
  }

  FormData formData() {
    return FormData.fromMap({
      "data": jsonEncode(toJson()),
      "image": images
          ?.map((e) => MultipartFile.fromFileSync(e.path, filename: e.name))
          .toList(),
    });
  }
}
