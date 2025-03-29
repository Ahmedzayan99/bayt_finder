import 'package:bayt_finder/models/property_details_model.dart';

import '../models/pagination_model.dart';


class FilterResponse {
  Pagination? pagination;
  List<PropertyDetail>? property;

  FilterResponse({this.pagination, this.property});

  FilterResponse.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['property'] != null) {
      property = <PropertyDetail>[];
      json['property'].forEach((v) {
        property!.add(PropertyDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (property != null) {
      data['property'] = property!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

