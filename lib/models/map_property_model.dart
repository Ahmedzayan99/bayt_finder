class MapPropertyModel {
  MapPropertyModel({
      this.pagination, 
      this.data,});

  MapPropertyModel.fromJson(dynamic json) {
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  Pagination? pagination;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
    latitude = double.parse(json['latitude']);
    longitude =double.parse( json['longitude']);
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
  double? latitude;
  double? longitude;
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

class Pagination {
  Pagination({
      this.totalItems, 
      this.perPage, 
      this.currentPage, 
      this.totalPages,});

  Pagination.fromJson(dynamic json) {
    totalItems = json['total_items'];
    perPage = json['per_page'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }
  int? totalItems;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_items'] = totalItems;
    map['per_page'] = perPage;
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    return map;
  }

}