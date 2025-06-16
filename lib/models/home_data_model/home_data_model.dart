import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  @JsonKey(name: 'error_code')
  int? errorCode;
  String? message;
  Data? data;

  HomeDataModel({this.errorCode, this.message, this.data});

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return _$HomeDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}
