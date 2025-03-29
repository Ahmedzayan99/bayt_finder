import 'package:bayt_finder/models/property_details_model.dart';
import 'article_response.dart';
import 'category_list_model.dart';

class DashboardResponse {
  AppSetting? appSetting;
  List<Category>? category;
  List<MSlider>? slider;
  List<AgentList>? agent;
  List<Amenity>? amenity;

  // List<UserProperty>? userProperty;
  List<OwnerProperty>? ownerProperty;
  List<PropertyDetail>? property;
  List<NearbyProperty>? nearByProperty;
  List<PropertyDetail>? fullyFurnishedProperty;
  List<PropertyType>? propertyType;
  List<Article>? article;
  List<PropertyCity>? propertyCity;
  FilterConfiguration? filterConfiguration;
  List<PropertyDetail>? advertisementProperty;

  DashboardResponse(
      {this.appSetting,
      this.category,
      this.slider,
      this.amenity,
      // this.userProperty,
      this.ownerProperty,
      this.property,
      this.nearByProperty,
      this.fullyFurnishedProperty,
      this.propertyType,
      this.article,
      this.propertyCity,
      this.filterConfiguration,
      this.advertisementProperty});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    appSetting = json['app_setting'] != null ? AppSetting.fromJson(json['app_setting']) : null;
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['slider'] != null) {
      slider = <MSlider>[];
      json['slider'].forEach((v) {
        slider!.add(MSlider.fromJson(v));
      });
    }
    if (json['agent'] != null) {
      agent = <AgentList>[];
      json['agent'].forEach((v) {
        agent!.add(AgentList.fromJson(v));
      });
    }
    if (json['amenity'] != null) {
      amenity = <Amenity>[];
      json['amenity'].forEach((v) {
        amenity!.add(Amenity.fromJson(v));
      });
    }
    // if (json['user_property'] != null) {
    //   userProperty = <UserProperty>[];
    //   json['user_property'].forEach((v) {
    //     userProperty!.add(new UserProperty.fromJson(v));
    //   });
    // }
    if (json['owner_property'] != null) {
      ownerProperty = <OwnerProperty>[];
      json['owner_property'].forEach((v) {
        ownerProperty!.add(OwnerProperty.fromJson(v));
      });
    }
    if (json['property'] != null) {
      property = <PropertyDetail>[];
      json['property'].forEach((v) {
        property!.add(PropertyDetail.fromJson(v));
      });
    }
    if (json['near_by_property'] != null) {
      nearByProperty = <NearbyProperty>[];
      json['near_by_property'].forEach((v) {
        nearByProperty!.add(NearbyProperty.fromJson(v));
      });
    }
    if (json['fully_furnished_property'] != null) {
      fullyFurnishedProperty = <PropertyDetail>[];
      json['fully_furnished_property'].forEach((v) {
        fullyFurnishedProperty!.add(PropertyDetail.fromJson(v));
      });
    }
    if (json['property_type'] != null) {
      propertyType = <PropertyType>[];
      json['property_type'].forEach((v) {
        propertyType!.add(PropertyType.fromJson(v));
      });
    }
    if (json['article'] != null) {
      article = <Article>[];
      json['article'].forEach((v) {
        article!.add(Article.fromJson(v));
      });
    }
    if (json['property_city'] != null) {
      propertyCity = <PropertyCity>[];
      json['property_city'].forEach((v) {
        propertyCity!.add(PropertyCity.fromJson(v));
      });
    }
    filterConfiguration = json['filter_configuration'] != null ? FilterConfiguration.fromJson(json['filter_configuration']) : null;
    if (json['advertisement_property'] != null) {
      advertisementProperty = <PropertyDetail>[];
      json['advertisement_property'].forEach((v) {
        advertisementProperty!.add(PropertyDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appSetting != null) {
      data['app_setting'] = appSetting!.toJson();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (amenity != null) {
      data['amenity'] = amenity!.map((v) => v.toJson()).toList();
    }
    // if (this.userProperty != null) {
    //   data['user_property'] = this.userProperty!.map((v) => v.toJson()).toList();
    // }
    if (ownerProperty != null) {
      data['owner_property'] = ownerProperty!.map((v) => v.toJson()).toList();
    }
    if (property != null) {
      data['property'] = property!.map((v) => v.toJson()).toList();
    }
    if (nearByProperty != null) {
      data['near_by_property'] = nearByProperty!.map((v) => v.toJson()).toList();
    }
    if (fullyFurnishedProperty != null) {
      data['fully_furnished_property'] = fullyFurnishedProperty!.map((v) => v.toJson()).toList();
    }
    if (propertyType != null) {
      data['property_type'] = propertyType!.map((v) => v.toJson()).toList();
    }
    if (article != null) {
      data['article'] = article!.map((v) => v.toJson()).toList();
    }
/*    if (propertyCity != null) {
      data['property_city'] = propertyCity!.map((v) => v.toJson()).toList();
    }*/
    if (filterConfiguration != null) {
      data['filter_configuration'] = filterConfiguration!.toJson();
    }
    if (advertisementProperty != null) {
      data['advertisement_property'] = advertisementProperty!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppSetting {
  int? id;
  String? siteName;
  String? siteEmail;
  String? siteLogo;
  String? siteFavicon;
  String? siteDescription;
  String? siteCopyright;
  String? facebookUrl;
  String? instagramUrl;
  String? twitterUrl;
  String? linkedinUrl;

  // List<String>? languageOption;
  String? contactEmail;
  String? contactNumber;
  String? helpSupportUrl;

  // List<Null>? notificationSettings;
  String? createdAt;
  String? updatedAt;
  TermsCondition? termsCondition;
  TermsCondition? privacyPolicy;
  String? subscription;
  CurrencySetting? currencySetting;

  AppSetting(
      {this.id,
      this.siteName,
      this.siteEmail,
      this.siteLogo,
      this.siteFavicon,
      this.siteDescription,
      this.siteCopyright,
      this.facebookUrl,
      this.instagramUrl,
      this.twitterUrl,
      this.linkedinUrl,
      // this.languageOption,
      this.contactEmail,
      this.contactNumber,
      this.helpSupportUrl,
      // this.notificationSettings,
      this.createdAt,
      this.updatedAt,
      this.termsCondition,
      this.privacyPolicy,
      this.subscription,
      this.currencySetting});

  AppSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteName = json['site_name'];
    siteEmail = json['site_email'];
    siteLogo = json['site_logo'];
    siteFavicon = json['site_favicon'];
    siteDescription = json['site_description'];
    siteCopyright = json['site_copyright'];
    facebookUrl = json['facebook_url'];
    instagramUrl = json['instagram_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    // languageOption = json['language_option'].cast<String>();
    contactEmail = json['contact_email'];
    contactNumber = json['contact_number'];
    helpSupportUrl = json['help_support_url'];
    // if (json['notification_settings'] != null) {
    //   notificationSettings = <Null>[];
    //   json['notification_settings'].forEach((v) {
    //     notificationSettings!.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    termsCondition = json['terms_condition'] != null ? TermsCondition.fromJson(json['terms_condition']) : null;
    privacyPolicy = json['privacy_policy'] != null ? TermsCondition.fromJson(json['privacy_policy']) : null;
    subscription = json['subscription'];
    currencySetting = json['currency_setting'] != null ? CurrencySetting.fromJson(json['currency_setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_name'] = siteName;
    data['site_email'] = siteEmail;
    data['site_logo'] = siteLogo;
    data['site_favicon'] = siteFavicon;
    data['site_description'] = siteDescription;
    data['site_copyright'] = siteCopyright;
    data['facebook_url'] = facebookUrl;
    data['instagram_url'] = instagramUrl;
    data['twitter_url'] = twitterUrl;
    data['linkedin_url'] = linkedinUrl;
    // data['language_option'] = this.languageOption;
    data['contact_email'] = contactEmail;
    data['contact_number'] = contactNumber;
    data['help_support_url'] = helpSupportUrl;
    // if (this.notificationSettings != null) {
    //   data['notification_settings'] =
    //       this.notificationSettings!.map((v) => v.toJson()).toList();
    // }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (termsCondition != null) {
      data['terms_condition'] = termsCondition!.toJson();
    }
    if (privacyPolicy != null) {
      data['privacy_policy'] = privacyPolicy!.toJson();
    }
    data['subscription'] = subscription;
    if (currencySetting != null) {
      data['currency_setting'] = currencySetting!.toJson();
    }
    return data;
  }
}

class TermsCondition {
  int? id;
  String? key;
  String? type;
  String? value;

  TermsCondition({this.id, this.key, this.type, this.value});

  TermsCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class CurrencySetting {
  String? name;
  String? symbol;
  String? code;
  String? position;

  CurrencySetting({this.name, this.symbol, this.code, this.position});

  CurrencySetting.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    code = json['code'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['code'] = code;
    data['position'] = position;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? status;
  String? categoryImage;
  List<AmenityNameCategory>? amenityName;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.status, this.categoryImage, this.amenityName, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    categoryImage = json['category_image'];
    if (json['amenity_name'] != null) {
      amenityName = <AmenityNameCategory>[];
      json['amenity_name'].forEach((v) {
        amenityName!.add(AmenityNameCategory.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['category_image'] = categoryImage;
    if (amenityName != null) {
      data['amenity_name'] = amenityName!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class AgentList {
  AgentList({
    this.id,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.username,
    this.status,
    this.userType,
    this.address,
    this.contactNumber,
    this.profileImage,
    this.loginType,
    this.latitude,
    this.longitude,
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

  AgentList.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    displayName = json['display_name'];
    email = json['email'];
    username = json['username'];
    status = json['status'];
    userType = json['user_type'];
    address = json['address'];
    contactNumber = json['contact_number'];
    profileImage = json['profile_image'];
    loginType = json['login_type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
  String? email;
  String? username;
  String? status;
  String? userType;
  dynamic address;
  String? contactNumber;
  String? profileImage;
  String? loginType;
  String? latitude;
  String? longitude;
  dynamic uid;
  String? playerId;
  String? timezone;
  int? isAgent;
  int? isBuilder;
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
    map['email'] = email;
    map['username'] = username;
    map['status'] = status;
    map['user_type'] = userType;
    map['address'] = address;
    map['contact_number'] = contactNumber;
    map['profile_image'] = profileImage;
    map['login_type'] = loginType;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
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

/*class AmenityName {
  int? id;
  String? title;
  int? status;
  String? type;

  // List<String>? value;
  String? createdAt;
  String? updatedAt;
  String? amenityImage;

  AmenityName(
      {this.id,
      this.title,
      this.status,
      this.type,
      // this.value,
      this.createdAt,
      this.updatedAt,
      this.amenityImage});

  AmenityName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    type = json['type'];
    // value = json['value'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    amenityImage = json['amenity_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = title;
    data['status'] = status;
    data['type'] = type;
    // data['value'] = this.value;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['amenity_image'] = amenityImage;
    return data;
  }
}*/

class MSlider {
  int? id;
  int? categoryId;
  String? categoryName;
  int? propertyId;
  String? propertyName;
  String? description;
  int? status;
  String? sliderImage;
  String? createdAt;
  String? updatedAt;

  MSlider({this.id, this.categoryId, this.categoryName, this.propertyId, this.propertyName, this.description, this.status, this.sliderImage, this.createdAt, this.updatedAt});

  MSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    propertyId = json['property_id'];
    propertyName = json['property_name'];
    description = json['description'];
    status = json['status'];
    sliderImage = json['slider_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['property_id'] = propertyId;
    data['property_name'] = propertyName;
    data['description'] = description;
    data['status'] = status;
    data['slider_image'] = sliderImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Amenity {
  int? id;
  String? name;
  String? type;
  int? status;

  // List<String>? values;
  String? amenityImage;
  String? createdAt;
  String? updatedAt;

  Amenity(
      {this.id,
      this.name,
      this.type,
      this.status,
      // this.values,
      this.amenityImage,
      this.createdAt,
      this.updatedAt});

  Amenity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    // values = json['values'].cast<String>();
    amenityImage = json['amenity_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['status'] = status;
    // data['values'] = this.values;
    data['amenity_image'] = amenityImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

/*class Property {
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
  String? propertyImage;
  int? isFavourite;
  int? propertyTypeId;
  String? propertyType;
  int? propertyFor;
  int? advertisementProperty;
  String? advertisementPropertyDate;

  Property(
      {this.id,
      this.name,
      this.categoryId,
      this.category,
      this.categoryImage,
      this.price,
      this.priceFormat,
      this.address,
      this.status,
      this.premiumProperty,
      this.propertyImage,
      this.isFavourite,
      this.propertyTypeId,
      this.propertyType,
      this.propertyFor,this.advertisementProperty,
        this.advertisementPropertyDate});

  Property.fromJson(Map<String, dynamic> json) {
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
    propertyImage = json['property_image'];
    isFavourite = json['is_favourite'];
    propertyTypeId = json['property_type_id'];
    propertyType = json['property_type'];
    propertyFor = json['property_for'];
    advertisementProperty = json['advertisement_property'];
    advertisementPropertyDate = json['advertisement_property_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['category_image'] = categoryImage;
    data['price'] = price;
    data['price_format'] = priceFormat;
    data['address'] = address;
    data['status'] = status;
    data['premium_property'] = premiumProperty;
    data['property_image'] = propertyImage;
    data['is_favourite'] = isFavourite;
    data['property_type_id'] = propertyTypeId;
    data['property_type'] = propertyType;
    data['property_for'] = propertyFor;
    data['advertisement_property'] = advertisementProperty;
    data['advertisement_property_date'] = advertisementPropertyDate;
    return data;
  }
}*/

class PropertyType {
  int? id;
  String? name;
  int? status;
  String? propertyTypeImage;
  String? createdAt;
  String? updatedAt;

  PropertyType({this.id, this.name, this.status, this.propertyTypeImage, this.createdAt, this.updatedAt});

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    propertyTypeImage = json['property_type_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['property_type_image'] = propertyTypeImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class OwnerProperty {
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
  String? propertyImage;
  int? isFavourite;
  int? propertyFor;
  int? advertisementProperty;
  String? advertisementPropertyDate;

  OwnerProperty(
      {this.id,
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
      this.propertyImage,
      this.isFavourite,
      this.propertyFor,
      this.advertisementProperty,
      this.advertisementPropertyDate});

  OwnerProperty.fromJson(Map<String, dynamic> json) {
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
    propertyImage = json['property_image'];
    isFavourite = json['is_favourite'];
    propertyFor = json['property_for'];
    advertisementProperty = json['advertisement_property'];
    advertisementPropertyDate = json['advertisement_property_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['category_image'] = categoryImage;
    data['price'] = price;
    data['price_format'] = priceFormat;
    data['address'] = address;
    data['status'] = status;
    data['premium_property'] = premiumProperty;
    data['price_duration'] = priceDuration;
    data['property_image'] = propertyImage;
    data['is_favourite'] = isFavourite;
    data['property_for'] = propertyFor;
    data['advertisement_property'] = advertisementProperty;
    data['advertisement_property_date'] = advertisementPropertyDate;
    return data;
  }
}

class AdvertisementProperty {
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
  String? propertyImage;
  int? isFavourite;
  int? propertyFor;
  int? advertisementProperty;
  String? advertisementPropertyDate;

  AdvertisementProperty(
      {this.id,
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
      this.propertyImage,
      this.isFavourite,
      this.propertyFor,
      this.advertisementProperty,
      this.advertisementPropertyDate});

  AdvertisementProperty.fromJson(Map<String, dynamic> json) {
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
    propertyImage = json['property_image'];
    isFavourite = json['is_favourite'];
    propertyFor = json['property_for'];
    advertisementProperty = json['advertisement_property'];
    advertisementPropertyDate = json['advertisement_property_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['category_image'] = categoryImage;
    data['price'] = price;
    data['price_format'] = priceFormat;
    data['address'] = address;
    data['status'] = status;
    data['premium_property'] = premiumProperty;
    data['price_duration'] = priceDuration;
    data['property_image'] = propertyImage;
    data['is_favourite'] = isFavourite;
    data['property_for'] = propertyFor;
    data['advertisement_property'] = advertisementProperty;
    data['advertisement_property_date'] = advertisementPropertyDate;
    return data;
  }
}

class NearbyProperty {
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
  String? propertyImage;
  int? isFavourite;
  int? propertyFor;
  int? advertisementProperty;
  String? advertisementPropertyDate;

  NearbyProperty(
      {this.id,
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
      this.propertyImage,
      this.isFavourite,
      this.propertyFor,
      this.advertisementProperty,
      this.advertisementPropertyDate});

  NearbyProperty.fromJson(Map<String, dynamic> json) {
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
    propertyImage = json['property_image'];
    isFavourite = json['is_favourite'];
    propertyFor = json['property_for'];
    advertisementProperty = json['advertisement_property'];
    advertisementPropertyDate = json['advertisement_property_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['category_image'] = categoryImage;
    data['price'] = price;
    data['price_format'] = priceFormat;
    data['address'] = address;
    data['status'] = status;
    data['premium_property'] = premiumProperty;
    data['price_duration'] = priceDuration;
    data['property_image'] = propertyImage;
    data['is_favourite'] = isFavourite;
    data['property_for'] = propertyFor;
    data['advertisement_property'] = advertisementProperty;
    data['advertisement_property_date'] = advertisementPropertyDate;
    return data;
  }
}

class FullyFurnishedProperty {
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
  String? propertyImage;
  int? isFavourite;
  int? propertyFor;
  int? advertisementProperty;
  String? advertisementPropertyDate;

  FullyFurnishedProperty(
      {this.id,
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
      this.propertyImage,
      this.isFavourite,
      this.propertyFor,
      this.advertisementProperty,
      this.advertisementPropertyDate});

  FullyFurnishedProperty.fromJson(Map<String, dynamic> json) {
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
    propertyImage = json['property_image'];
    isFavourite = json['is_favourite'];
    propertyFor = json['property_for'];
    advertisementProperty = json['advertisement_property'];
    advertisementPropertyDate = json['advertisement_property_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['category_image'] = categoryImage;
    data['price'] = price;
    data['price_format'] = priceFormat;
    data['address'] = address;
    data['status'] = status;
    data['premium_property'] = premiumProperty;
    data['price_duration'] = priceDuration;
    data['property_image'] = propertyImage;
    data['is_favourite'] = isFavourite;
    data['property_for'] = propertyFor;
    data['advertisement_property'] = advertisementProperty;
    data['advertisement_property_date'] = advertisementPropertyDate;
    return data;
  }
}

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class PropertyCity {
  String? title;
  String? selectVal;
  String? categoryImage;
  String? createdAt;
  String? updatedAt;
  int? count;
  PropertyCity({this.title,this.count,this.selectVal,this.categoryImage,this.createdAt,this.updatedAt});

  PropertyCity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    selectVal = json['selectVal'];
    count = json['count'];
    categoryImage = json['category_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class FilterConfiguration {
  int? minPrice;
  int? maxPrice;
  int? minBrokerage;
  int? maxBrokerage;
  int? minSecurityDeposit;
  int? maxSecurityDeposit;
  num? minAgeOfProperty;
  num? maxAgeOfProperty;

  FilterConfiguration({this.minPrice, this.maxPrice, this.minBrokerage, this.maxBrokerage, this.minSecurityDeposit, this.maxSecurityDeposit, this.minAgeOfProperty, this.maxAgeOfProperty});

  FilterConfiguration.fromJson(Map<String, dynamic> json) {
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    minBrokerage = json['min_brokerage'];
    maxBrokerage = json['max_brokerage'];
    minSecurityDeposit = json['min_security_deposit'];
    maxSecurityDeposit = json['max_security_deposit'];
    minAgeOfProperty = json['min_age_of_property'];
    maxAgeOfProperty = json['max_age_of_property'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    data['min_brokerage'] = minBrokerage;
    data['max_brokerage'] = maxBrokerage;
    data['min_security_deposit'] = minSecurityDeposit;
    data['max_security_deposit'] = maxSecurityDeposit;
    data['min_age_of_property'] = minAgeOfProperty;
    data['max_age_of_property'] = maxAgeOfProperty;
    return data;
  }
}
