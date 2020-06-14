import 'package:json_annotation/json_annotation.dart';

part "benefit.g.dart";

@JsonSerializable(explicitToJson: true)
class Benefit {
  final int id;
  final String name;
  final int value;

  Benefit({
    this.id,
    this.name,
    this.value
  });

  factory Benefit.fromJson(Map<String, dynamic> json) => _$BenefitFromJson(json);

  Map<String, dynamic> toJson() => _$BenefitToJson(this);
}
