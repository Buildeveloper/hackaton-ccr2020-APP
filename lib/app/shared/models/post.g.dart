// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    text: json['text'] as String,
    userId: json['userId'] as int,
    channelId: json['channelId'] as int,
    points: json['points'] as int,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'userId': instance.userId,
      'channelId': instance.channelId,
      'points': instance.points,
    };
