import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AddCampaignModel {
  AddCampaignModel({
    this.advertiserId,
    this.campaignName,
    this.campaignDescription,
    this.campaignStartDate,
    this.campaignEndDate,
    this.campaignTargetAudience,
    this.campaignPrice,
    this.campaignOffer,
    this.campaignVideos,
    this.campaignLocation,
    this.images,
  });

  AddCampaignModel.fromJson(dynamic json) {
    advertiserId = json['advertiser_id'];
    campaignName = json['campaign_name'];
    campaignDescription = json['campaign_description'];
    campaignStartDate = json['campaign_start_date'];
    campaignEndDate = json['campaign_end_date'];
    campaignTargetAudience = json['campaign_target_audience'];
    campaignPrice = json['campaign_price'];
    campaignOffer = json['campaign_offer'];
    campaignVideos = json['campaign_videos'] != null
        ? json['campaign_videos'].cast<String>()
        : [];
    campaignLocation = json['locations'] != null
        ? Map<String, dynamic>.from(json['locations'])
        : {};
  }

  num? advertiserId;
  String? campaignName;
  String? campaignDescription;
  String? campaignStartDate;
  String? campaignEndDate;
  String? campaignTargetAudience;
  num? campaignPrice;
  num? campaignOffer;
  List<String>? campaignVideos;
  Map<String, dynamic>? campaignLocation;
  List<XFile>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['advertiser_id'] = advertiserId;
    map['campaign_name'] = campaignName;
    map['campaign_description'] = campaignDescription;
    map['campaign_start_date'] = campaignStartDate;
    map['campaign_end_date'] = campaignEndDate;
    map['campaign_target_audience'] = campaignTargetAudience;
    map['campaign_price'] = campaignPrice;
    map['campaign_offer'] = campaignOffer;
    map['campaign_videos'] = campaignVideos;
    map['locations'] = campaignLocation;
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
