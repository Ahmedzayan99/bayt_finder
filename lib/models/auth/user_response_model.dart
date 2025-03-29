class UserResponseModel {
  UserResponseModel({
      this.data, 
      this.subscriptionDetail, 
      this.planLimitCount, 
      this.property,});

  UserResponseModel.fromJson(dynamic json) {
    data = json['data'] != null ? UserResponseData.fromJson(json['data']) : null;
    subscriptionDetail = json['subscription_detail'] != null ? SubscriptionDetail.fromJson(json['subscription_detail']) : null;
    planLimitCount = json['plan_limit_count'] != null ? PlanLimitCount.fromJson(json['plan_limit_count']) : null;
    if (json['property'] != null) {
      property = [];
      json['property'].forEach((v) {
        property?.add(Property.fromJson(v));
      });
    }else{
      property = [];
    }
  }
  UserResponseData? data;
  SubscriptionDetail? subscriptionDetail;
  PlanLimitCount? planLimitCount;
  List<Property>? property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (subscriptionDetail != null) {
      map['subscription_detail'] = subscriptionDetail?.toJson();
    }
    if (planLimitCount != null) {
      map['plan_limit_count'] = planLimitCount?.toJson();
    }
    if (property != null) {
      map['property'] = property?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Property {
  Property({
      this.id, 
      this.name, 
      this.categoryId, 
      this.category, 
      this.categoryImage, 
      this.price, 
      this.priceFormat, 
      this.address, 
      this.status, 
      this.premiumProperty, 
      this.priceDuration, 
      this.furnishedType, 
      this.sallerType, 
      this.ageOfProperty, 
      this.maintenance, 
      this.securityDeposit, 
      this.brokerage, 
      this.bhk, 
      this.sqft, 
      this.description, 
      this.country, 
      this.state, 
      this.city, 
      this.latitude, 
      this.longitude, 
      this.videoUrl, 
      this.propertyGallary, 
      this.propertyGallaryArray, 
      this.createdAt, 
      this.updatedAt, 
      this.checkedPropertyInquiry, 
      this.propertyImage, 
      this.isFavourite, 
      this.propertyFor, 
      this.advertisementProperty, 
      this.advertisementPropertyDate,});

  Property.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    category = json['category'];
    categoryImage = json['category_image'];
    price = json['price'];
    priceFormat = json['price_format'];
    address = json['address'];
    status = json['status'];
    premiumProperty = json['premium_property'];
    priceDuration = json['price_duration'];
    furnishedType = json['furnished_type'];
    sallerType = json['saller_type'];
    ageOfProperty = json['age_of_property'];
    maintenance = json['maintenance'];
    securityDeposit = json['security_deposit'];
    brokerage = json['brokerage'];
    bhk = json['bhk'];
    sqft = json['sqft'];
    description = json['description'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    videoUrl = json['video_url'];
    propertyGallary = json['property_gallary'] != null ? json['property_gallary'].cast<String>() : [];
    if (json['property_gallary_array'] != null) {
      propertyGallaryArray = [];
      json['property_gallary_array'].forEach((v) {
        propertyGallaryArray?.add(PropertyGallaryArray.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    checkedPropertyInquiry = json['checked_property_inquiry'];
    propertyImage = json['property_image'];
    isFavourite = json['is_favourite'];
    propertyFor = json['property_for'];
    advertisementProperty = json['advertisement_property'];
    advertisementPropertyDate = json['advertisement_property_date'];
  }
  int? id;
  String? name;
  int? categoryId;
  String? category;
  String? categoryImage;
  int? price;
  String? priceFormat;
  String? address;
  int? status;
  int? premiumProperty;
  String? priceDuration;
  int? furnishedType;
  int? sallerType;
  int? ageOfProperty;
  int? maintenance;
  int? securityDeposit;
  int? brokerage;
  int? bhk;
  String? sqft;
  String? description;
  String? country;
  String? state;
  String? city;
  String? latitude;
  String? longitude;
  dynamic videoUrl;
  List<String>? propertyGallary;
  List<PropertyGallaryArray>? propertyGallaryArray;
  String? createdAt;
  String? updatedAt;
  int? checkedPropertyInquiry;
  String? propertyImage;
  int? isFavourite;
  int? propertyFor;
  dynamic advertisementProperty;
  dynamic advertisementPropertyDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category_id'] = categoryId;
    map['category'] = category;
    map['category_image'] = categoryImage;
    map['price'] = price;
    map['price_format'] = priceFormat;
    map['address'] = address;
    map['status'] = status;
    map['premium_property'] = premiumProperty;
    map['price_duration'] = priceDuration;
    map['furnished_type'] = furnishedType;
    map['saller_type'] = sallerType;
    map['age_of_property'] = ageOfProperty;
    map['maintenance'] = maintenance;
    map['security_deposit'] = securityDeposit;
    map['brokerage'] = brokerage;
    map['bhk'] = bhk;
    map['sqft'] = sqft;
    map['description'] = description;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['video_url'] = videoUrl;
    map['property_gallary'] = propertyGallary;
    if (propertyGallaryArray != null) {
      map['property_gallary_array'] = propertyGallaryArray?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['checked_property_inquiry'] = checkedPropertyInquiry;
    map['property_image'] = propertyImage;
    map['is_favourite'] = isFavourite;
    map['property_for'] = propertyFor;
    map['advertisement_property'] = advertisementProperty;
    map['advertisement_property_date'] = advertisementPropertyDate;
    return map;
  }

}

class PropertyGallaryArray {
  PropertyGallaryArray({
      this.id, 
      this.url,});

  PropertyGallaryArray.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
  }
  int? id;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    return map;
  }

}

class PlanLimitCount {
  PlanLimitCount({
      this.totalProperty, 
      this.totalContactView, 
      this.totalAdvertisementProperty,});

  PlanLimitCount.fromJson(dynamic json) {
    totalProperty = json['total_property'];
    totalContactView = json['total_contact_view'];
    totalAdvertisementProperty = json['total_advertisement_property'];
  }
  int? totalProperty;
  int? totalContactView;
  int? totalAdvertisementProperty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_property'] = totalProperty;
    map['total_contact_view'] = totalContactView;
    map['total_advertisement_property'] = totalAdvertisementProperty;
    return map;
  }

}

class SubscriptionDetail {
  SubscriptionDetail({
      this.isSubscribe, 
      this.subscriptionPlan,});

  SubscriptionDetail.fromJson(dynamic json) {
    isSubscribe = json['is_subscribe'];
    subscriptionPlan = json['subscription_plan'];
  }
  int? isSubscribe;
  dynamic subscriptionPlan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_subscribe'] = isSubscribe;
    map['subscription_plan'] = subscriptionPlan;
    return map;
  }

}

class UserResponseData {
  UserResponseData({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.displayName, 
      this.username, 
      this.minBudget, 
      this.maxBudget, 
      this.interestType, 
      this.latitude, 
      this.longitude, 
      this.city, 
      this.countryCode, 
      this.phone, 
      this.whatsapp, 
      this.description, 
      this.email, 
      this.status, 
      this.userType, 
      this.address, 
      this.contactNumber, 
      this.profileImage, 
      this.loginType, 
      this.uid, 
      this.playerId, 
      this.timezone, 
      this.isAgent, 
      this.isBuilder, 
      this.lastNotificationSeen, 
      this.isSubscribe, 
      this.viewLimitCount, 
      this.addLimitCount, 
      this.advertisementLimit, 
      this.createdAt, 
      this.updatedAt,});

  UserResponseData.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    displayName = json['display_name'];
    username = json['username'];
    minBudget = json['min_budget'];
    maxBudget = json['max_budget'];
    interestType = json['interest_type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    countryCode = json['country_code'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    description = json['description'];
    email = json['email'];
    status = json['status'];
    userType = json['user_type'];
    address = json['address'];
    contactNumber = json['contact_number'];
    profileImage = json['profile_image'];
    loginType = json['login_type'];
    uid = json['uid'];
    playerId = json['player_id'];
    timezone = json['timezone'];
    isAgent = json['is_agent'];
    isBuilder = json['is_builder'];
    lastNotificationSeen = json['last_notification_seen'];
    isSubscribe = json['is_subscribe'];
    viewLimitCount = json['view_limit_count'];
    addLimitCount = json['add_limit_count'];
    advertisementLimit = json['advertisement_limit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? displayName;
  String? username;
  dynamic minBudget;
  dynamic maxBudget;
  String? interestType;
  String? latitude;
  String? longitude;
  dynamic city;
  String? countryCode;
  dynamic phone;
  dynamic whatsapp;
  dynamic description;
  String? email;
  String? status;
  String? userType;
  dynamic address;
  String? contactNumber;
  String? profileImage;
  String? loginType;
  dynamic uid;
  String? playerId;
  String? timezone;
  dynamic isAgent;
  dynamic isBuilder;
  dynamic lastNotificationSeen;
  int? isSubscribe;
  dynamic viewLimitCount;
  dynamic addLimitCount;
  dynamic advertisementLimit;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['display_name'] = displayName;
    map['username'] = username;
    map['min_budget'] = minBudget;
    map['max_budget'] = maxBudget;
    map['interest_type'] = interestType;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['city'] = city;
    map['country_code'] = countryCode;
    map['phone'] = phone;
    map['whatsapp'] = whatsapp;
    map['description'] = description;
    map['email'] = email;
    map['status'] = status;
    map['user_type'] = userType;
    map['address'] = address;
    map['contact_number'] = contactNumber;
    map['profile_image'] = profileImage;
    map['login_type'] = loginType;
    map['uid'] = uid;
    map['player_id'] = playerId;
    map['timezone'] = timezone;
    map['is_agent'] = isAgent;
    map['is_builder'] = isBuilder;
    map['last_notification_seen'] = lastNotificationSeen;
    map['is_subscribe'] = isSubscribe;
    map['view_limit_count'] = viewLimitCount;
    map['add_limit_count'] = addLimitCount;
    map['advertisement_limit'] = advertisementLimit;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}