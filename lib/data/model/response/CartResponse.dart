import 'package:ecommerce_route/data/model/response/base_response.dart';

import 'cart_dm.dart';

class CartResponse extends BaseResponse {
  String? status;
  num? numOfCartItems;
  CartDM? data;

  CartResponse({
    this.status,
    this.numOfCartItems,
    this.data,
  });

  CartResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartDM.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
