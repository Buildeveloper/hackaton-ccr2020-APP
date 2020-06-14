// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'benefit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Benefit _$BenefitFromJson(Map<String, dynamic> json) {
  return Benefit(
    id: json['id'] as int,
    name: json['name'] as String,
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$BenefitToJson(Benefit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
