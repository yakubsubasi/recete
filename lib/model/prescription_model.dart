import 'package:json_annotation/json_annotation.dart';
import 'package:recete/model/medicine_model.dart';

part 'prescription_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Prescription {
  Prescription(
      {this.id,
      this.name,
      this.shortDescription,
      this.explanation,
      this.medicines});

  String? id;
  String? name;
  String? shortDescription;
  String? explanation;
  List<Medicine>? medicines;

  factory Prescription.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$PrescriptionToJson(this);
}
