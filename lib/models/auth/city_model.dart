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
      this.name});

  CityListData.fromJson(dynamic json) {
    name = json['name'];

  }
  String? name;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}