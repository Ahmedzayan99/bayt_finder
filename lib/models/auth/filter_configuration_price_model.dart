class FilterConfigurationPriceModel {
  FilterConfigurationPriceModel({
      this.minPrice, 
      this.maxPrice,});

  FilterConfigurationPriceModel.fromJson(dynamic json) {
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
  }
  int? minPrice;
  int? maxPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min_price'] = minPrice;
    map['max_price'] = maxPrice;
    return map;
  }

}