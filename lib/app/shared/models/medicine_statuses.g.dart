// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_statuses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineStatuses _$MedicineStatusesFromJson(Map<String, dynamic> json) {
  return MedicineStatuses(
    id: json['id'] as int,
    userId: json['userId'] as int,
    medicineId: json['medicineId'] as int,
    hours: json['hours'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$MedicineStatusesToJson(MedicineStatuses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'medicineId': instance.medicineId,
      'hours': instance.hours,
      'status': instance.status,
    };
