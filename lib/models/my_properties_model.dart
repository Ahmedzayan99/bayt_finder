
import 'package:bayt_finder/models/property_details_model.dart';

import 'pagination_model.dart';

class MyPropertiesResponseModel {
  bool? status;
  Pagination? pagination;
  List<PropertyDetail>? data;

  MyPropertiesResponseModel({this.status, this.pagination, this.data});

  MyPropertiesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = <PropertyDetail>[];
      json['data'].forEach((v) {
        data!.add(PropertyDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PropertyTypeList {
  int? id;
  String? title;
  bool? select;

  PropertyTypeList(this.id, this.title, this.select);
}