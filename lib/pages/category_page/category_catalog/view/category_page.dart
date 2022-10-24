import 'package:flutter/material.dart';
import 'package:recete/model/disease_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kategoriler',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: Speciality.values.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Speciality.values[index].imagepath,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(Speciality.values[index].valeu),
                ],
              ),
            );
          }),
    );
  }
}
