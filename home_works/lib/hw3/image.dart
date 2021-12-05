import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class GalleryImage {
  GalleryImage({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory GalleryImage.fromJson(Map<String, dynamic> json) => _$GalleryImageFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryImageToJson(this);
}