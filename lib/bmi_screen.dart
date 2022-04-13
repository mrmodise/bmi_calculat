import 'package:bmi_calculator/menu_bottom.dart';
import 'package:flutter/material.dart';

import 'menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeightCtrl = TextEditingController();
  final TextEditingController txtWeightCtrl = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMsg = '';
  String weightMsg = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMsg =
        'Please insert your height in ' + ((isMetric) ? 'metres' : 'inches');
    weightMsg =
        'Please insert your height in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      // bottomNavigationBar: MenuBottom(),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Column(
        children: [
          ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric', style: TextStyle(fontSize: fontSize)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Imperial', style: TextStyle(fontSize: fontSize)),
                )
              ],
              isSelected: isSelected,
              onPressed: (value) {
                toggleMeasure(value);
              }),
          TextField(
            controller: txtHeightCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: heightMsg),
          ),
          TextField(
            controller: txtWeightCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: weightMsg),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: fontSize),
              ))
        ],
      ),
    );
  }

  void toggleMeasure(int value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
