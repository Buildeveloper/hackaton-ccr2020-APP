import 'package:json_annotation/json_annotation.dart';

part "channel.g.dart";

@JsonSerializable(explicitToJson: true)
class Channel {
  final int id;
  final String name;

  const Channel({
    this.id,
    this.name,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
