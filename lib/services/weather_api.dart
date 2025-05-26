import 'dart:convert';
import 'package:http/http.dart' as http;

const String weatherApiKey = '7899c6c8431ca0d4580120ad174ea1ba';
const String currentWeatherEndPoint = 'https://api.openweathermap.org/data/2.5/weather';

Future<dynamic> getWeatherForCity ({required String city}) async
{
  final weatherUrl = '$currentWeatherEndPoint?units=metric&q=$city&appid=$weatherApiKey';

  try {
    final resp = await http.get(Uri.parse(weatherUrl));

    if (resp.statusCode != 200) {
      throw Exception('There was a problem with the request: status ${resp
          .statusCode} received');
    }

    return json.decode(resp.body);
  }
  catch (e)
    {
      throw Exception('There was a problem with the request: ${e.toString()}');
    }
  }
