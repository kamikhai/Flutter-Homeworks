
import 'package:json_annotation/json_annotation.dart';

part 'post_image.g.dart';

@JsonSerializable()
class PostImage {
  PostImage({
    required this.id,
    required this.postId,
    required this.image
  });

  int id;
  int postId;
  String image;

  factory PostImage.fromJson(Map<String, dynamic> json) => _$PostImageFromJson(json);

  Map<String, dynamic> toJson() => _$PostImageToJson(this);
}