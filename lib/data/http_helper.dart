import 'dart:convert';

import 'package:bmi_calculator/data/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';

  Future<Weather> getWeather(String lat, String lon) async {
    await dotenv.load(fileName: '.env');
    final String apiKey = dotenv.env['API_KEY'] ?? '';
    Map<String, dynamic> parameters = {'lat': lat, 'lon': lon, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJSON(data);
    return weather;
  }
}
