import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  String? image;
  String? type;
  int? id;

  Banner({this.image, this.type, this.id});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return _$BannerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
