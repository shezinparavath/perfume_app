// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  homeFields: (json['home_fields'] as List<dynamic>?)
      ?.map((e) => HomeField.fromJson(e as Map<String, dynamic>))
      .toList(),
  notificationCount: (json['notification_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'home_fields': instance.homeFields,
  'notification_count': instance.notificationCount,
};
