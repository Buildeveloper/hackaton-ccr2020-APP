import 'package:json_annotation/json_annotation.dart';

part "medicine_statuses.g.dart";

@JsonSerializable(explicitToJson: true)

class MedicineStatuses {
  final int id;
  final int userId;
  final int medicineId;
  final String hours;
  final int status;

  MedicineStatuses({
    this.id,
    this.userId,
    this.medicineId,
    this.hours,
    this.status
  });

  factory MedicineStatuses.fromJson(Map<String, dynamic> json) => _$MedicineStatusesFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineStatusesToJson(this);
}