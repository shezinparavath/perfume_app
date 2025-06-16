// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
  image: json['image'] as String?,
  type: json['type'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
  'image': instance.image,
  'type': instance.type,
  'id': instance.id,
};
