import 'package:json_annotation/json_annotation.dart';

part "post.g.dart";

@JsonSerializable(explicitToJson: true)
class Post {
  final int id;
  final String text;
  final int userId;
  final int channelId;
  final int points;

  const Post({
    this.id,
    this.text,
    this.userId,
    this.channelId,
    this.points
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
