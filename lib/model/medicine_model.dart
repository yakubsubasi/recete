import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicine_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Medicine {
  Medicine({
    this.id,
    this.name,
    this.activeSubstance,
    this.howOften,
    this.howMany,
    this.units,
    this.howToUse,
    this.periode,
  }) {
    _$assertMedicine(this);
  }

  String? id;
  String? name;
  String? activeSubstance;
  @Min(1)
  int? howOften;
  @Min(1)
  int? howMany;
  String? units;
  String? howToUse;
  String? periode;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}
