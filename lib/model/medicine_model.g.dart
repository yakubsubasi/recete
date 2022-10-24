// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

_$assertMedicine(Medicine instance) {
  const Min(1).validate(instance.howOften, "howOften");
  const Min(1).validate(instance.howMany, "howMany");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      id: json['id'] as String?,
      name: json['name'] as String?,
      activeSubstance: json['activeSubstance'] as String?,
      howOften: json['howOften'] as int?,
      howMany: json['howMany'] as int?,
      units: json['units'] as String?,
      howToUse: json['howToUse'] as String?,
      periode: json['periode'] as String?,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'activeSubstance': instance.activeSubstance,
      'howOften': instance.howOften,
      'howMany': instance.howMany,
      'units': instance.units,
      'howToUse': instance.howToUse,
      'periode': instance.periode,
    };
