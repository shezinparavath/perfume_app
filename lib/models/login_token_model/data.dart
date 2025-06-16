import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'access_token')
  String? accessToken;

  Data({this.accessToken});

  @override
  String toString() => 'Data(accessToken: $accessToken)';

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({String? accessToken}) {
    return Data(accessToken: accessToken ?? this.accessToken);
  }
}
