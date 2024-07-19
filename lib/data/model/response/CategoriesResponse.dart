import 'package:ecommerce_route/data/model/response/base_response.dart';
import 'Metadata.dart';
import 'category_dm.dart';

class CategoriesResponse extends BaseResponse {
  num? results;
  Metadata? metadata;
  List<CategoryDM>? data;

  CategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
