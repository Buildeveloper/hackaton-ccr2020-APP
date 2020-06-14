import 'package:json_annotation/json_annotation.dart';

part 'ace_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AceResponse<T> {
  dynamic data;

  AceResponse(this.data);

  factory AceResponse.fromJson(Map<String, dynamic> json) => _$AceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AceResponseToJson(this);
}