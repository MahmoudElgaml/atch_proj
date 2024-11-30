class DetailCampaignModel {
  DetailCampaignModel({
    this.campaigns,
  });

  DetailCampaignModel.fromJson(dynamic json) {
    campaigns = json['campaigns'] != null
        ? DetailCampaigns.fromJson(json['campaigns'])
        : null;
  }

  DetailCampaigns? campaigns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (campaigns != null) {
      map['campaigns'] = campaigns?.toJson();
    }
    return map;
  }
}

class DetailCampaigns {
  DetailCampaigns({
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
    this.videos,
    this.winner,
  });

  DetailCampaigns.fromJson(dynamic json) {
    advertiser = json['advertiser'] != null
        ? DetailAdvertiser.fromJson(json['advertiser'])
        : null;
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
    videos = json['videos'] != null ? json['videos'].cast<String>() : [];
    winner = json['winner'];
  }

  DetailAdvertiser? advertiser;
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
  List<String>? videos;
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

    // new location
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }

    map['offer'] = offer;
    map['price'] = price;
    map['start_date'] = startDate;
    map['target_audience'] = targetAudience;
    map['videos'] = videos;
    map['winner'] = winner;
    return map;
  }
}

class DetailAdvertiser {
  DetailAdvertiser({
    this.about,
    this.advertiserType,
    this.email,
    this.id,
    this.name,
    this.phone,
    this.profilePic,
    this.referralCode,
    this.username,
    this.locations, // Added locations as Map
  });

  DetailAdvertiser.fromJson(dynamic json) {
    about = json['about'];
    advertiserType = json['advertiser_type'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    referralCode = json['referral_code'];
    username = json['username'];
    phone = json['phones'] != null ? json['phones'].cast<String>() : [];
    locations = json['locations'] != null
        ? Map<String, dynamic>.from(
            json['locations']) // Handling Map for locations
        : {};
  }

  String? about;
  String? advertiserType;
  String? email;
  num? id;
  String? name;
  String? profilePic;
  dynamic referralCode;
  String? username;
  List<String>? phone;
  Map<String, dynamic>? locations; // Added locations as a Map

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about'] = about;
    map['advertiser_type'] = advertiserType;
    map['email'] = email;
    map['id'] = id;
    map['name'] = name;
    map['profile_pic'] = profilePic;
    map['referral_code'] = referralCode;
    map['username'] = username;
    map['phones'] = phone;
    map['locations'] = locations; // Adding locations to the map
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