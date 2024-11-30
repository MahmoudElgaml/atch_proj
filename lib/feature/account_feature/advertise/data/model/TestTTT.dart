class TestTtt {
  TestTtt({
    this.campaigns,
  });

  TestTtt.fromJson(dynamic json) {
    if (json['campaigns'] != null) {
      campaigns = [];
      json['campaigns'].forEach((v) {
        campaigns?.add(Campaigns.fromJson(v));
      });
    }
  }

  List<Campaigns>? campaigns;

  TestTtt copyWith({
    List<Campaigns>? campaigns,
  }) =>
      TestTtt(
        campaigns: campaigns ?? this.campaigns,
      );

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
    this.approved,
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

  Campaigns.fromJson(dynamic json) {
    advertiser = json['advertiser'] != null
        ? Advertiser.fromJson(json['advertiser'])
        : null;
    advertiserId = json['advertiser_id'];
    approved = json['approved'];
    campaignName = json['campaign_name'];
    description = json['description'];
    endDate = json['end_date'];
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
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

  Advertiser? advertiser;
  num? advertiserId;
  String? approved;
  String? campaignName;
  String? description;
  String? endDate;
  num? id;
  List<String>? images;
  Locations? locations;
  num? offer;
  num? price;
  String? startDate;
  String? targetAudience;
  List<String>? videos;
  dynamic winner;

  Campaigns copyWith({
    Advertiser? advertiser,
    num? advertiserId,
    String? approved,
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
  }) =>
      Campaigns(
        advertiser: advertiser ?? this.advertiser,
        advertiserId: advertiserId ?? this.advertiserId,
        approved: approved ?? this.approved,
        campaignName: campaignName ?? this.campaignName,
        description: description ?? this.description,
        endDate: endDate ?? this.endDate,
        id: id ?? this.id,
        images: images ?? this.images,
        locations: locations ?? this.locations,
        offer: offer ?? this.offer,
        price: price ?? this.price,
        startDate: startDate ?? this.startDate,
        targetAudience: targetAudience ?? this.targetAudience,
        videos: videos ?? this.videos,
        winner: winner ?? this.winner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (advertiser != null) {
      map['advertiser'] = advertiser?.toJson();
    }
    map['advertiser_id'] = advertiserId;
    map['approved'] = approved;
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
    map['videos'] = videos;
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

  Locations copyWith({
    Location0? location0,
    Location1? location1,
  }) =>
      Locations(
        location0: location0 ?? this.location0,
        location1: location1 ?? this.location1,
      );

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

  Location1 copyWith({
    num? lat,
    String? link,
    num? lng,
    String? name,
  }) =>
      Location1(
        lat: lat ?? this.lat,
        link: link ?? this.link,
        lng: lng ?? this.lng,
        name: name ?? this.name,
      );

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

  Location0 copyWith({
    num? lat,
    String? link,
    num? lng,
    String? name,
  }) =>
      Location0(
        lat: lat ?? this.lat,
        link: link ?? this.link,
        lng: lng ?? this.lng,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['link'] = link;
    map['lng'] = lng;
    map['name'] = name;
    return map;
  }
}

class Advertiser {
  Advertiser({
    this.about,
    this.advertiserType,
    this.email,
    this.id,
    this.name,
    this.profilePic,
    this.referralCode,
    this.username,
  });

  Advertiser.fromJson(dynamic json) {
    about = json['about'];
    advertiserType = json['advertiser_type'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    referralCode = json['referral_code'];
    username = json['username'];
  }

  String? about;
  String? advertiserType;
  String? email;
  num? id;
  String? name;
  String? profilePic;
  String? referralCode;
  String? username;

  Advertiser copyWith({
    String? about,
    String? advertiserType,
    String? email,
    num? id,
    String? name,
    String? profilePic,
    String? referralCode,
    String? username,
  }) =>
      Advertiser(
        about: about ?? this.about,
        advertiserType: advertiserType ?? this.advertiserType,
        email: email ?? this.email,
        id: id ?? this.id,
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
        referralCode: referralCode ?? this.referralCode,
        username: username ?? this.username,
      );

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
    return map;
  }
}
