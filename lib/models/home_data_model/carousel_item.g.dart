// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarouselItem _$CarouselItemFromJson(Map<String, dynamic> json) => CarouselItem(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$CarouselItemToJson(CarouselItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'type': instance.type,
    };
