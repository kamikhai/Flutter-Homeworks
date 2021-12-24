
import 'package:json_annotation/json_annotation.dart';

part 'stories.g.dart';

@JsonSerializable()
class Stories {
  Stories({
    required this.id,
    required this.userId,
  });

  int id;
  int userId;

  factory Stories.fromJson(Map<String, dynamic> json) => _$StoriesFromJson(json);

  Map<String, dynamic> toJson() => _$StoriesToJson(this);
}