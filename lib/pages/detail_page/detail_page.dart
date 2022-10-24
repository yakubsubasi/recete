import 'package:flutter/material.dart';
import 'package:recete/model/disease_model.dart';
import 'package:recete/pages/detail_page/widgets/prescription_card.dart';

class DiseaseDetailPage extends StatelessWidget {
  const DiseaseDetailPage({
    Key? key,
    required this.disease,
  }) : super(key: key);

  final Disease disease;

  // Controller'a aktarılması gereken fonksiyonlar

/*   Future<List<Prescription>> getPrestcritpitons(Disease disease) async {
    var prescriptions = await diseaseRef.doc(disease.id).prescriptions.get();

    return prescriptions.docs.map((e) => e.data).toList();
  }

  Future<List<Medicine>> getMedicines(
      String diseaseId, String prescriptionId) async {
    var medicines = await diseaseRef
        .doc(diseaseId)
        .prescriptions
        .doc(prescriptionId)
        .medicines
        .get();

    return medicines.docs.map((e) => e.data).toList();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          disease.name ?? ' ',
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: disease.prescriptions?.length ?? 0,
              itemBuilder: (context, index) {
                return PrescriptionCard(
                  prescription: disease.prescriptions![index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
