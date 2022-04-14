import 'package:bmi_calculator/data/http_helper.dart';
import 'package:bmi_calculator/data/weather.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  TextEditingController txtLatCtrl = TextEditingController();
  TextEditingController txtLonCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: txtLatCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Enter latitude',
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: txtLonCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Enter longitude',
                    ),
                  )),
              ElevatedButton(
                  onPressed: getData,
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 16),
                  )),
              weatherRow('Place: ', result.name),
              weatherRow('Description : ', result.description),
              weatherRow('Temperature : ', result.temperature.toStringAsFixed(2)),
              weatherRow('Perceived : ', result.perceived.toStringAsFixed(2)),
              weatherRow('Pressure : ', result.pressure.toStringAsFixed(2)),
              weatherRow('Humidity : ', result.humidity.toStringAsFixed(2)),
            ],
          )),
    );
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(txtLatCtrl.text, txtLonCtrl.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(label, style: TextStyle(
                  fontSize: 20,
                  color: Theme
                      .of(context)
                      .hintColor
              ))),
          Expanded(
              flex: 4,
              child: Text(value, style: TextStyle(
                  fontSize: 20,
                  color: Theme
                      .of(context)
                      .primaryColorDark
              )))
        ],
      ),
    );
    return row;
  }
}
