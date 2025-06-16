import 'package:json_annotation/json_annotation.dart';

import 'home_field.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'home_fields')
  List<HomeField>? homeFields;
  @JsonKey(name: 'notification_count')
  int? notificationCount;

  Data({this.homeFields, this.notificationCount});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
