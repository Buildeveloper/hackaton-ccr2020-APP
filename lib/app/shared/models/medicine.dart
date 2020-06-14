import 'package:json_annotation/json_annotation.dart';

import 'medicine_hours.dart';
import 'medicine_statuses.dart';

part "medicine.g.dart";

@JsonSerializable(explicitToJson: true)
class Medicine {
  final int id;
  final int userId;
  final String name;
  final String days;
  final int points;
  final List<MedicineHours> medicineHours;
  final List<MedicineStatuses> medicineHoursStatuses;

  Medicine({
    this.id,
    this.userId,
    this.name,
    this.days,
    this.points,
    this.medicineHours,
    this.medicineHoursStatuses
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => _$MedicineFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}