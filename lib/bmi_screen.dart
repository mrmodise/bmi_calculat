import 'package:bmi_calculator/menu_bottom.dart';
import 'package:flutter/material.dart';
import 'menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      // bottomNavigationBar: MenuBottom(),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: const Center(child: FlutterLogo()),
    );
  }
}
