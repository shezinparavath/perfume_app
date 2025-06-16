// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenModel _$LoginTokenModelFromJson(Map<String, dynamic> json) =>
    LoginTokenModel(
      errorCode: (json['error_code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginTokenModelToJson(LoginTokenModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };
