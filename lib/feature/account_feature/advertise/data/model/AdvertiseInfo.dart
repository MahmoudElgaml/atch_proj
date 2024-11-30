class AdvertiseInfoModel {
  Advertiser? advertiser;
  List<AdvertiseCampaigns>? campaigns;

  AdvertiseInfoModel({
    this.advertiser,
    this.campaigns,
  });

  AdvertiseInfoModel.fromJson(dynamic json) {
    advertiser = json['advertiser'] != null
        ? Advertiser.fromJson(json['advertiser'])
        : null;
    if (json['campaigns'] != null) {
      campaigns = [];
      json['campaigns'].forEach((v) {
        campaigns?.add(AdvertiseCampaigns.fromJson(v));
      });
    }
  }

  AdvertiseInfoModel copyWith({
    Advertiser? advertiser,
    List<AdvertiseCampaigns>? campaigns,
  }) {
    return AdvertiseInfoModel(
      advertiser: advertiser?.copyWith() ?? this.advertiser?.copyWith(),
      campaigns: campaigns != null
          ? campaigns.map((campaign) => campaign.copyWith()).toList()
          : this.campaigns?.map((campaign) => campaign.copyWith()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (advertiser != null) {
      map['advertiser'] = advertiser?.toJson();
    }
    if (campaigns != null) {
      map['campaigns'] = campaigns?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AdvertiseCampaigns {
  num? advertiserId;
  String? campaignName;
  String? description;
  String? endDate;
  num? id;
  List<String>? images;

  // Convert locations back to Locations type
  Locations? locations;

  num? offer;
  num? price;
  String? startDate;
  String? targetAudience;
  List<String>? videos;
  dynamic winner;

  AdvertiseCampaigns({
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

  AdvertiseCampaigns.fromJson(dynamic json) {
    advertiserId = json['advertiser_id'];
    campaignName = json['campaign_name'];
    description = json['description'];
    endDate = json['end_date'];
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];

    // Convert locations back to Locations type
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

  AdvertiseCampaigns copyWith({
    num? advertiserId,
    String? campaignName,
    String? description,
    String? endDate,
    num? id,
    List<String>? images,
    Locations? locations,
    num? offer,
    num? price,
    String? startDate,
    String? targetAudience,
    List<String>? videos,
    dynamic winner,
  }) {
    return AdvertiseCampaigns(
      advertiserId: advertiserId ?? this.advertiserId,
      campaignName: campaignName ?? this.campaignName,
      description: description ?? this.description,
      endDate: endDate ?? this.endDate,
      id: id ?? this.id,
      images: images != null
          ? List<String>.from(images)
          : List<String>.from(this.images ?? []),

      // Use the provided locations or fallback to the current ones
      locations: locations ?? this.locations?.copyWith(),

      offer: offer ?? this.offer,
      price: price ?? this.price,
      startDate: startDate ?? this.startDate,
      targetAudience: targetAudience ?? this.targetAudience,
      videos: videos != null
          ? List<String>.from(videos)
          : List<String>.from(this.videos ?? []),
      winner: winner ?? this.winner,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['advertiser_id'] = advertiserId;
    map['campaign_name'] = campaignName;
    map['description'] = description;
    map['end_date'] = endDate;
    map['id'] = id;
    map['images'] = images;

    // Convert locations back to Locations type
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

class Advertiser {
  String? about;
  String? advertiserType;
  String? email;
  num? id;

  // Convert locations back to Locations type
  Locations? locations;

  String? name;
  List<String>? phones;
  String? profilePic;
  dynamic referralCode;
  String? username;

  Advertiser({
    this.about,
    this.advertiserType,
    this.email,
    this.id,
    this.locations,
    this.name,
    this.phones,
    this.profilePic,
    this.referralCode,
    this.username,
  });

  Advertiser.fromJson(dynamic json) {
    about = json['about'];
    advertiserType = json['advertiser_type'];
    email = json['email'];
    id = json['id'];

    // Convert locations back to Locations type
    locations = json['locations'] != null
        ? Locations.fromJson(json['locations'])
        : null;

    name = json['name'];
    phones = json['phones'] != null ? json['phones'].cast<String>() : [];
    profilePic = json['profile_pic'];
    referralCode = json['referral_code'];
    username = json['username'];
  }

  Advertiser copyWith({
    String? about,
    String? advertiserType,
    String? email,
    num? id,
    Locations? locations,
    String? name,
    List<String>? phones,
    String? profilePic,
    dynamic referralCode,
    String? username,
  }) {
    return Advertiser(
      about: about ?? this.about,
      advertiserType: advertiserType ?? this.advertiserType,
      email: email ?? this.email,
      id: id ?? this.id,

      // Use the provided locations or fallback to the current ones
      locations: locations ?? this.locations?.copyWith(),

      name: name ?? this.name,
      phones: phones != null
          ? List<String>.from(phones)
          : List<String>.from(this.phones ?? []),
      profilePic: profilePic ?? this.profilePic,
      referralCode: referralCode ?? this.referralCode,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about'] = about;
    map['advertiser_type'] = advertiserType;
    map['email'] = email;
    map['id'] = id;

    // Convert locations back to Locations type
    if (locations != null) {
      map['locations'] = locations?.toJson();
    }

    map['name'] = name;
    map['phones'] = phones;
    map['profile_pic'] = profilePic;
    map['referral_code'] = referralCode;
    map['username'] = username;
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

  Locations copyWith({
    Location0? location0,
    Location1? location1,
  }) {
    return Locations(
      location0: location0 ?? this.location0?.copyWith(),
      location1: location1 ?? this.location1?.copyWith(),
    );
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

  // add copy with
  Location1 copyWith({
    num? lat,
    String? link,
    num? lng,
    String? name,
  }) {
    return Location1(
      lat: lat ?? this.lat,
      link: link ?? this.link,
      lng: lng ?? this.lng,
      name: name ?? this.name,
    );
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

  // add copy with
  Location0 copyWith({
    num? lat,
    String? link,
    num? lng,
    String? name,
  }) {
    return Location0(
      lat: lat ?? this.lat,
      link: link ?? this.link,
      lng: lng ?? this.lng,
      name: name ?? this.name,
    );
  }
}
