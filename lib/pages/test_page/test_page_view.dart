import 'package:flutter/material.dart';
import 'package:recete/model/disease_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('test'),
        ),
      ),
    );
  }
}
