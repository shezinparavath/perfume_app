import 'package:json_annotation/json_annotation.dart';

import 'banner.dart';
import 'brand.dart';
import 'carousel_item.dart';
import 'category.dart';
import 'product.dart';

part 'home_field.g.dart';

@JsonSerializable()
class HomeField {
  String? type;
  @JsonKey(name: 'carousel_items')
  List<CarouselItem>? carouselItems;
  List<Brand>? brands;
  List<Category>? categories;
  String? image;
  @JsonKey(name: 'collection_id')
  int? collectionId;
  String? name;
  List<Product>? products;
  List<Banner>? banners;
  Banner? banner;

  HomeField({
    this.type,
    this.carouselItems,
    this.brands,
    this.categories,
    this.image,
    this.collectionId,
    this.name,
    this.products,
    this.banners,
    this.banner,
  });

  factory HomeField.fromJson(Map<String, dynamic> json) {
    return _$HomeFieldFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeFieldToJson(this);
}
