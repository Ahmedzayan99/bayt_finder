class FilterConfigurationPriceModel {
  FilterConfigurationPriceModel({
      this.minPrice, 
      this.maxPrice,});

  FilterConfigurationPriceModel.fromJson(dynamic json) {
    minPrice = json['min_price'].toDouble();
    maxPrice = json['max_price'].toDouble();
  }
  double? minPrice;
  double? maxPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min_price'] = minPrice;
    map['max_price'] = maxPrice;
    return map;
  }

}