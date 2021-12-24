// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostImage _$PostImageFromJson(Map<String, dynamic> json) => PostImage(
      id: json['id'] as int,
      postId: json['postId'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$PostImageToJson(PostImage instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'image': instance.image,
    };
