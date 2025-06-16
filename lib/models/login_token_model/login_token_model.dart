import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_token_model.g.dart';

@JsonSerializable()
class LoginTokenModel {
  @JsonKey(name: 'error_code')
  int? errorCode;
  String? message;
  Data? data;

  LoginTokenModel({this.errorCode, this.message, this.data});

  @override
  String toString() {
    return 'LoginTokenModel(errorCode: $errorCode, message: $message, data: $data)';
  }

  factory LoginTokenModel.fromJson(Map<String, dynamic> json) {
    return _$LoginTokenModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginTokenModelToJson(this);

  LoginTokenModel copyWith({int? errorCode, String? message, Data? data}) {
    return LoginTokenModel(
      errorCode: errorCode ?? this.errorCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
