import 'package:ecommerce_route/data/model/response/base_response.dart';
import 'package:ecommerce_route/data/model/response/product_dm.dart';

class WishListResponse extends BaseResponse{
  String? status;
  num? count;
  List<ProductDM>? data;

  WishListResponse({
      this.status, 
      this.count, 
      this.data,});

  WishListResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}