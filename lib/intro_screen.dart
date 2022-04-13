import 'package:bmi_calculator/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Globo Fitness')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
