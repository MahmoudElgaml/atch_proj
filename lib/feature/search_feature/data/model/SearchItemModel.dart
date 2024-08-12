class SearchItemModel {
  SearchItemModel({
    this.campaigns,
  });

  SearchItemModel.fromJson(dynamic json) {
    if (json['campaigns'] != null) {
      campaigns = [];
      json['campaigns'].forEach((v) {
        campaigns?.add(SearchCampaigns.fromJson(v));
      });
    }
  }

  List<SearchCampaigns>? campaigns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (campaigns != null) {
      map['campaigns'] = campaigns?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SearchCampaigns {
  SearchCampaigns({
    this.advertiserId,
    this.campaignName,
    this.description,
    this.endDate,
    this.id,
    this.offer,
    this.price,
    this.startDate,
    this.targetAudience,
  });

  SearchCampaigns.fromJson(dynamic json) {
    advertiserId = json['advertiser_id'];
    campaignName = json['campaign_name'];
    description = json['description'];
    endDate = json['end_date'];
    id = json['id'];
    offer = json['offer'];
    price = json['price'];
    startDate = json['start_date'];
    targetAudience = json['target_audience'];
  }

  num? advertiserId;
  String? campaignName;
  String? description;
  String? endDate;
  num? id;
  num? offer;
  num? price;
  String? startDate;
  String? targetAudience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['advertiser_id'] = advertiserId;
    map['campaign_name'] = campaignName;
    map['description'] = description;
    map['end_date'] = endDate;
    map['id'] = id;
    map['offer'] = offer;
    map['price'] = price;
    map['start_date'] = startDate;
    map['target_audience'] = targetAudience;
    return map;
  }
}
