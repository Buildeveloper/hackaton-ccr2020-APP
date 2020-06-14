import 'package:json_annotation/json_annotation.dart';

part "medicine_hours.g.dart";

@JsonSerializable(explicitToJson: true)
class MedicineHours {
  final String hours;

  MedicineHours({
    this.hours
  });

  factory MedicineHours.fromJson(Map<String, dynamic> json) => _$MedicineHoursFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineHoursToJson(this);
}