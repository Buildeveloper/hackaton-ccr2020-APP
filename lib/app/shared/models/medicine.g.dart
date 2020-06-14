// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) {
  return Medicine(
    id: json['id'] as int,
    userId: json['userId'] as int,
    name: json['name'] as String,
    days: json['days'] as String,
    points: json['points'] as int,
    medicineHours: (json['medicineHours'] as List)
        ?.map((e) => e == null
            ? null
            : MedicineHours.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    medicineHoursStatuses: (json['medicineHoursStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : MedicineStatuses.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'days': instance.days,
      'points': instance.points,
      'medicineHours':
          instance.medicineHours?.map((e) => e?.toJson())?.toList(),
      'medicineHoursStatuses':
          instance.medicineHoursStatuses?.map((e) => e?.toJson())?.toList(),
    };
