import '../models/pagination_model.dart';


class ArticleResponse {
  String? status;
  Pagination? pagination;
  List<Article>? data;

  ArticleResponse({this.status, this.pagination, this.data});

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = <Article>[];
      json['data'].forEach((v) {
        data!.add(Article.fromJson(v));
      });
    }else{
      data = <Article>[];
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
class Article {
  int? id;
  String? name;
  List<Tags>? tags;
  String? description;
  int? status;
  String? articleImage;
  String? createdAt;
  String? updatedAt;

  Article({this.id, this.name, this.tags, this.description, this.status, this.articleImage, this.createdAt, this.updatedAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
    articleImage = json['article_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['status'] = status;
    data['article_image'] = articleImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
