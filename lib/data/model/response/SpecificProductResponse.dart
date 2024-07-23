import 'package:ecommerce_route/data/model/response/product_dm.dart';

class SpecificProductResponse {
  ProductDM? data;

  SpecificProductResponse({this.data,});

  SpecificProductResponse.fromJson(dynamic json) {
    data = json['data'] != null ? ProductDM.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}