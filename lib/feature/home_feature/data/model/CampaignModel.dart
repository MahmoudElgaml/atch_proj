class CampaignModel {
  CampaignModel({
    this.campaigns,
  });

  CampaignModel.fromJson(dynamic json) {
    if (json['used_offers'] != null) {
      campaigns = [];
      json['used_offers'].forEach((v) {
        campaigns?.add(Campaigns.fromJson(v));
      });
    }
  }

  List<Campaigns>? campaigns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (campaigns != null) {
      map['campaigns'] = campaigns?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Campaigns {
  Campaigns({
    this.advertiser,
    this.advertiserId,
    this.campaignName,
    this.description,
    this.endDate,
    this.id,
    this.images,
    this.locations,
    this.offer,
    this.price,
    this.startDate,
    this.targetAudience,
    this.winner,
  });

  Campaigns.fromJson(dynamic json) {
    advertiser = json['advertiser'] != null
        ? Advertiser.fromJson(json['advertiser'])
        : null;
    advertiserId = json['advertiser_id'];
    campaignName = json['campaign_name'];
    description = json['description'];
    endDate = json['end_date'];
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    locations =
        json['locations'] != null ? json['locations'].cast<String>() : [];
    offer = json['offer'];
    price = json['price'];
    startDate = json['start_date'];
    targetAudience = json['target_audience'];
    winner = json['winner'];
  }

  Advertiser? advertiser;
  num? advertiserId;
  String? campaignName;
  String? description;
  String? endDate;
  num? id;
  List<String>? images;
  List<String>? locations;
  num? offer;
  num? price;
  String? startDate;
  String? targetAudience;
  dynamic winner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (advertiser != null) {
      map['advertiser'] = advertiser?.toJson();
    }
    map['advertiser_id'] = advertiserId;
    map['campaign_name'] = campaignName;
    map['description'] = description;
    map['end_date'] = endDate;
    map['id'] = id;
    map['images'] = images;
    map['locations'] = locations;
    map['offer'] = offer;
    map['price'] = price;
    map['start_date'] = startDate;
    map['target_audience'] = targetAudience;
    map['winner'] = winner;
    return map;
  }
}

class Advertiser {
  Advertiser({
    this.about,
    this.advertiserName,
    this.advertiserPic,
    this.advertiserType,
    this.companyName,
    this.contactEmail,
    this.id,
    this.referralCode,
    this.visaNumber,
  });

  Advertiser.fromJson(dynamic json) {
    about = json['about'];
    advertiserName = json['advertiser_name'];
    advertiserPic = json['advertiser_pic'];
    advertiserType = json['advertiser_type'];
    companyName = json['company_name'];
    contactEmail = json['contact_email'];
    id = json['id'];
    referralCode = json['referral_code'];
    visaNumber = json['visa_number'];
  }

  String? about;
  String? advertiserName;
  String? advertiserPic;
  String? advertiserType;
  String? companyName;
  String? contactEmail;
  num? id;
  num? referralCode;
  String? visaNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about'] = about;
    map['advertiser_name'] = advertiserName;
    map['advertiser_pic'] = advertiserPic;
    map['advertiser_type'] = advertiserType;
    map['company_name'] = companyName;
    map['contact_email'] = contactEmail;
    map['id'] = id;
    map['referral_code'] = referralCode;
    map['visa_number'] = visaNumber;
    return map;
  }
}
