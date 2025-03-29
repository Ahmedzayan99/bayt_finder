class PlaceAddressModel {
  double? latitude;
  double? longitude;
  String? placeId;
  String? name;
  String? placeAddress;
  String? country;
  String? state;
  String? city;
  String? cityAR;
  String? photoReference;

  PlaceAddressModel(
      {this.latitude,
      this.longitude,
      this.placeId,
      this.placeAddress,
      this.name,
      this.country,
      this.state,
      this.city,
      this.photoReference,
      this.cityAR});

  factory PlaceAddressModel.fromJson(Map<String, dynamic> json) {
    return PlaceAddressModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      placeId: json['placeId'],
      placeAddress: json['placeAddress'],
      photoReference: json['photoReference'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['placeId'] = placeId;
    data['placeAddress'] = placeAddress;
    data['photoReference'] = photoReference;
    return data;
  }
}
