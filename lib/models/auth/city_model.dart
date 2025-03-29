class CityModel {
  CityModel({
      this.cityListData,});

  CityModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      cityListData = [];
      json['data'].forEach((v) {
        cityListData?.add(CityListData.fromJson(v));
      });
    }
  }
  List<CityListData>? cityListData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cityListData != null) {
      map['data'] = cityListData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CityListData {
  CityListData({
      this.title,this.selectVal,this.count,this.categoryImage,this.createdAt,this.updatedAt,});

  CityListData.fromJson(dynamic json) {
    title = json['title']??'';
    selectVal = json['selectVal']??'';
    count = json['count'];
    categoryImage = json['category_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


  }
  String? title;
  String? selectVal;
  int? count;
  String? categoryImage;
  String? createdAt;
  String? updatedAt;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }

}