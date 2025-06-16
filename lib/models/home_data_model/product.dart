import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? image;
  String? name;
  String? currency;
  String? unit;
  bool? wishlisted;
  @JsonKey(name: 'rfq_status')
  bool? rfqStatus;
  @JsonKey(name: 'cart_count')
  int? cartCount;
  @JsonKey(name: 'future_cart_count')
  int? futureCartCount;
  @JsonKey(name: 'has_stock')
  bool? hasStock;
  String? price;
  @JsonKey(name: 'actual_price')
  String? actualPrice;
  String? offer;
  @JsonKey(name: 'offer_prices')
  List<dynamic>? offerPrices;

  Product({
    this.id,
    this.image,
    this.name,
    this.currency,
    this.unit,
    this.wishlisted,
    this.rfqStatus,
    this.cartCount,
    this.futureCartCount,
    this.hasStock,
    this.price,
    this.actualPrice,
    this.offer,
    this.offerPrices,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
