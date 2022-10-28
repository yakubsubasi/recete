import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:recete/model/disease_model.dart';
import 'package:recete/model/medicine_model.dart';
import 'package:recete/model/prescription_model.dart';

class ListFieldFormBloc extends FormBloc<String, String> {
  final diseaseName = TextFieldBloc(name: 'diseaseName', validators: [
    FieldBlocValidators.required,
  ]);

  final prescriptions = ListFieldBloc<PrescriptionFieldBloc, dynamic>(
      name: 'prescriptions',
      fieldBlocs: [
        PrescriptionFieldBloc(
          name: 'prescription',
          prescriptionName: TextFieldBloc(name: 'name'),
          shortDescription: TextFieldBloc(name: 'shortDescription'),
          isIlyasYolbas: BooleanFieldBloc(name: 'isIlyasYolbas'),
          explanation: TextFieldBloc(name: 'explanation'),
          medicines: ListFieldBloc(name: 'medicines', fieldBlocs: [
            MedicineFieldBloc(
              name: 'medicine',
              medicineName: TextFieldBloc(
                  name: 'medicineName',
                  validators: [FieldBlocValidators.required]),
              activeSubstance: TextFieldBloc(name: 'activeSubstance'),
              howOften: TextFieldBloc(name: 'howOften'),
              howMany: TextFieldBloc(name: 'howMany'),
              units: TextFieldBloc(name: 'units'),
              howToUse: TextFieldBloc(name: 'howToUse'),
              numberOfBoxes: TextFieldBloc(name: 'numberOfBoxes'),
            )
          ]),
        )
      ]);

  final specialites = MultiSelectFieldBloc(items: Speciality.values);

  ListFieldFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        specialites,
        diseaseName,
        prescriptions,
      ],
    );
  }

  void addPrescription() {
    prescriptions.addFieldBloc(PrescriptionFieldBloc(
      name: 'prescription',
      prescriptionName: TextFieldBloc(name: 'name'),
      shortDescription: TextFieldBloc(name: 'shortDescription'),
      medicines: ListFieldBloc(name: 'medicines'),
      isIlyasYolbas: BooleanFieldBloc(name: 'isIlyasYolbas'),
      explanation: TextFieldBloc(name: 'explanation'),
    ));
  }

  void removePrescription(int index) {
    prescriptions.removeFieldBlocAt(index);
  }

  void addMedicineToPrescription(int prescriptionIndex) {
    prescriptions.value[prescriptionIndex].medicines.addFieldBloc(
        MedicineFieldBloc(
            name: 'medicine',
            medicineName: TextFieldBloc(
                name: 'medicineName',
                validators: [FieldBlocValidators.required]),
            activeSubstance: TextFieldBloc(name: 'activeSubstance'),
            howOften: TextFieldBloc(name: 'howOften'),
            howMany: TextFieldBloc(name: 'howMany'),
            units: TextFieldBloc(name: 'units'),
            howToUse: TextFieldBloc(name: 'howToUse'),
            numberOfBoxes: TextFieldBloc(name: 'numberOfBoxes')));
  }

  void removeMedicineFromPrescription(
      {required int memberIndex, required int hobbyIndex}) {
    prescriptions.value[memberIndex].medicines.removeFieldBlocAt(hobbyIndex);
  }

  @override
  void onSubmitting() async {
    print("denem 1");

    final disease = Disease(
      name: diseaseName.value,
      specialities: specialites.value,
      prescriptions: prescriptions.value.map<Prescription>((prescriptionField) {
        return Prescription(
            name: prescriptionField.prescriptionName.value,
            shortDescription: prescriptionField.shortDescription.value,
            isIlyasYolbas: prescriptionField.isIlyasYolbas.value,
            explanation: prescriptionField.explanation.value,
            medicines: prescriptionField.medicines.value
                .map<Medicine>((medicineField) {
              return Medicine(
                  name: medicineField.medicineName.value,
                  activeSubstance: medicineField.activeSubstance.value,
                  howOften: medicineField.howOften.value,
                  howMany: medicineField.howMany.value,
                  units: medicineField.units.value,
                  howToUse: medicineField.howToUse.value,
                  numberOfBoxes: int.parse(medicineField.numberOfBoxes.value));
            }).toList());
      }).toList(),
    );

    diseaseRef.add(disease);

    print("denem 2");

    debugPrint(disease.toJson().toString());

    emitSuccess(
        canSubmitAgain: false, successResponse: "Reçete başarıyla eklendi");
  }
}

/* Without serialization
    final clubV1 = Club(
      clubName: diseaseName.value,
      members: prescriptions.value.map<Member>((memberField) {
        return Member(
          firstName: memberField.prescriptionName.value,
          lastName: memberField.shortDescription.value,
          /*  hobbies: memberField.medicines.value
              .map((hobbyField) => hobbyField.value)
              .toList(),  */
        );
      }).toList(),
    );

    debugPrint('clubV1');
    debugPrint(clubV1.toJson().toString());

    // With Serialization
    final clubV2 = Club.fromJson(state.toJson());

    debugPrint('clubV2');
    debugPrint(clubV2.toJson().toString());

    emitSuccess(
      canSubmitAgain: true,
      successResponse: const JsonEncoder.withIndent('    ').convert(
        state.toJson(),
      ),
    );
  }
}*/
class PrescriptionFieldBloc extends GroupFieldBloc {
  final BooleanFieldBloc isIlyasYolbas;
  final TextFieldBloc prescriptionName;
  final TextFieldBloc shortDescription;
  final ListFieldBloc<MedicineFieldBloc, dynamic> medicines;
  final TextFieldBloc explanation;

  PrescriptionFieldBloc({
    required this.isIlyasYolbas,
    required this.prescriptionName,
    required this.shortDescription,
    required this.medicines,
    required this.explanation,
    String? name,
  }) : super(name: name, fieldBlocs: [
          prescriptionName,
          shortDescription,
          medicines,
          isIlyasYolbas,
          explanation
        ]);
}

class MedicineFieldBloc extends GroupFieldBloc {
  final TextFieldBloc medicineName;
  final TextFieldBloc activeSubstance;
  final TextFieldBloc howOften;
  final TextFieldBloc howMany;
  final TextFieldBloc units;
  final TextFieldBloc howToUse;
  final TextFieldBloc numberOfBoxes;

  MedicineFieldBloc({
    required this.medicineName,
    required this.activeSubstance,
    required this.howOften,
    required this.howMany,
    required this.units,
    required this.howToUse,
    required this.numberOfBoxes,
    String? name,
  }) : super(
          name: name,
          fieldBlocs: [
            medicineName,
            activeSubstance,
            howOften,
            howMany,
            units,
            howToUse,
            numberOfBoxes
          ],
        );
}
