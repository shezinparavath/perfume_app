// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeField _$HomeFieldFromJson(Map<String, dynamic> json) => HomeField(
  type: json['type'] as String?,
  carouselItems: (json['carousel_items'] as List<dynamic>?)
      ?.map((e) => CarouselItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  brands: (json['brands'] as List<dynamic>?)
      ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
  image: json['image'] as String?,
  collectionId: (json['collection_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
  banners: (json['banners'] as List<dynamic>?)
      ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
      .toList(),
  banner: json['banner'] == null
      ? null
      : Banner.fromJson(json['banner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeFieldToJson(HomeField instance) => <String, dynamic>{
  'type': instance.type,
  'carousel_items': instance.carouselItems,
  'brands': instance.brands,
  'categories': instance.categories,
  'image': instance.image,
  'collection_id': instance.collectionId,
  'name': instance.name,
  'products': instance.products,
  'banners': instance.banners,
  'banner': instance.banner,
};
