import 'package:ecommerce_route/data/model/response/product_dm.dart';

class CartProduct {
  num? count;
  String? id;
  ProductDM? product;
  num? price;

  CartProduct({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartProduct.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }
}