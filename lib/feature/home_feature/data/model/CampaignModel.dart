class CampaignModel {
  CampaignModel({
    this.campaigns,
  });

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
    this.winner,
  });

  Campaigns.fromJson(dynamic json) {
    advertiserId = json['advertiser_id'];
    campaignName = json['campaign_name'];
    description = json['description'];
    endDate = json['end_date'];
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];

    // Parse locations as Map<String, dynamic>
    locations = json['locations'] != null
        ? Locations.fromJson(json['locations'])
        : null;

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

  // Use Map<String, dynamic> for locations
  Locations? locations;

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

    if (locations != null) {
      map['locations'] = locations?.toJson();
    }

    map['offer'] = offer;
    map['price'] = price;
    map['start_date'] = startDate;
    map['target_audience'] = targetAudience;
    map['winner'] = winner;
    return map;
  }
}

class Locations {
  Locations({
    this.location0,
    this.location1,
  });

  Locations.fromJson(dynamic json) {
    location0 = json['location0'] != null
        ? Location0.fromJson(json['location0'])
        : null;
    location1 = json['location1'] != null
        ? Location1.fromJson(json['location1'])
        : null;
  }

  Location0? location0;
  Location1? location1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location0 != null) {
      map['location0'] = location0?.toJson();
    }
    if (location1 != null) {
      map['location1'] = location1?.toJson();
    }
    return map;
  }
}

class Location1 {
  Location1({
    this.lat,
    this.link,
    this.lng,
    this.name,
  });

  Location1.fromJson(dynamic json) {
    lat = json['lat'];
    link = json['link'];
    lng = json['lng'];
    name = json['name'];
  }

  num? lat;
  String? link;
  num? lng;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['link'] = link;
    map['lng'] = lng;
    map['name'] = name;
    return map;
  }
}

class Location0 {
  Location0({
    this.lat,
    this.link,
    this.lng,
    this.name,
  });

  Location0.fromJson(dynamic json) {
    lat = json['lat'];
    link = json['link'];
    lng = json['lng'];
    name = json['name'];
  }

  num? lat;
  String? link;
  num? lng;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['link'] = link;
    map['lng'] = lng;
    map['name'] = name;
    return map;
  }
}
