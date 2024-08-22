class CampaignModel {
  CampaignModel({
      this.campaigns,});

  CampaignModel.fromJson(dynamic json) {
    if (json['campaigns'] != null) {
      campaigns = [];
      json['campaigns'].forEach((v) {
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
      this.winner,});

  Campaigns.fromJson(dynamic json) {
    advertiserId = json['advertiser_id'];
    campaignName = json['campaign_name'];
    description = json['description'];
    endDate = json['end_date'];
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    locations = json['locations'] != null ? json['locations'].cast<String>() : [];
    offer = json['offer'];
    price = json['price'];
    startDate = json['start_date'];
    targetAudience = json['target_audience'];
    winner = json['winner'];
  }
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