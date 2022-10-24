import 'package:flutter/material.dart';
import 'package:recete/pages/category_page/category_catalog/view/category_page.dart';

import 'package:recete/pages/form_page/view/form_page_screen.dart';
import 'package:recete/pages/list_page/landing_page.dart';
import 'package:recete/pages/test_page/test_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;
  final screens = const [LandingPage(), FormPage(), TestPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentindex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
          ]),
    );
  }
}
