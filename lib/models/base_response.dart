


class EPropertyBaseResponse {
  String? message;
  bool? status;
  int? propertyId;

  EPropertyBaseResponse({this.message, this.propertyId, this.status});

  EPropertyBaseResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['property_id'] = propertyId;
    return data;
  }
}
