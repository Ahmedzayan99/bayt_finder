class PhotosGoogleMap {
  PhotosGoogleMap({

      this.result, 
      this.status,});

  PhotosGoogleMap.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Result? result;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['status'] = status;
    return map;
  }

}

class Result {
  Result({

      this.photos, 
      this.placeId, 
      this.reference, 
     });

  Result.fromJson(dynamic json) {

    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
  }

  List<Photos>? photos;
  String? placeId;
  String? reference;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = placeId;
    map['reference'] = reference;
    return map;
  }

}

class Photos {
  Photos({
      this.height, 
      this.htmlAttributions, 
      this.photoReference, 
      this.width,});

  Photos.fromJson(dynamic json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'] != null ? json['html_attributions'].cast<String>() : [];
    photoReference = json['photo_reference'];
    width = json['width'];
  }
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['html_attributions'] = htmlAttributions;
    map['photo_reference'] = photoReference;
    map['width'] = width;
    return map;
  }

}



