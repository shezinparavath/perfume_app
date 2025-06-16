import 'package:json_annotation/json_annotation.dart';

part 'carousel_item.g.dart';

@JsonSerializable()
class CarouselItem {
  int? id;
  String? image;
  String? type;

  CarouselItem({this.id, this.image, this.type});

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return _$CarouselItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CarouselItemToJson(this);
}
