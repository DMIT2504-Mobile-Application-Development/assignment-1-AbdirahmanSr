import 'dart:ffi';

class CurrentWeather
{
  String _city;
  String _description;
  double _currentTemp;
  DateTime _currentTime;
  DateTime _sunrise;
  DateTime _sunset;

  String get city => _city;
  String get description => _description;
  double get currentTemp => _currentTemp;
  DateTime get currentTime => _currentTime;
  DateTime get sunrise => _sunrise;
  DateTime get sunset => _sunset;

  set city (String value)
  {
    if (value.isEmpty)
    {
      throw Exception('City cannot be empty');
    }
    _city = value;
  }

  set description (String value)
  {
    if (value.isEmpty)
    {
      throw Exception('City cannot be empty');
    }
    _description = value;
  }

  set currentTemp (double value)
  {
    if (value < -100 || value > 100)
    {
      throw Exception('Temperature must be between -100 and 100');
    }
    _currentTemp = value;
  }

  set currentTime (DateTime value)
  {
    if (value.isAfter(DateTime.now()))
    {
      throw Exception('Current time cannot be in the future');
    }
    _currentTime = value;
  }

  set sunrise (DateTime value)
  {
    if (value.isAfter(DateTime.now()))
    {
      throw Exception('Sunrise must be on the same day as current time');
    }
    _sunrise = value;
  }

  set sunset (DateTime value)
  {
    if (value != DateTime.now() || value.isBefore(DateTime.now()))
    {
      throw Exception('Sunset cannot be before sunrise');
    }
    _sunset = value;
  }

  CurrentWeather({
    required String city,
    required String description,
    required double currentTemp,
    required DateTime currentTime,
    required DateTime sunrise,
    required DateTime sunset,
  })  : _city = city,
        _description = description,
        _currentTemp = currentTemp,
        _currentTime = currentTime,
        _sunrise = sunrise,
        _sunset = sunset {
    this.city = city;
    this.description = description;
    this.currentTemp = currentTemp;
    this.currentTime = currentTime;
    this.sunrise = sunrise;
    this.sunset = sunset;
  }

  factory CurrentWeather.fromOpenWeatherData(dynamic data) {
    try {
      final city = data['name'] as String;
      final description = data['weather'][0]['description'] as String;
      final currentTemp = (data['main']['temp'] as num).toDouble();
      final currentTime = DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
      final sunrise = DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'] * 1000);
      final sunset = DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000);

      return CurrentWeather(
        city: city,
        description: description,
        currentTemp: currentTemp,
        currentTime: currentTime,
        sunrise: sunrise,
        sunset: sunset,
      );
    } catch (e) {
      throw Exception('Failed to parse weather data: ${e.toString()}');
    }
  }

  @override
  String toString() {
    return 'City: $_city, Description: $_description, Current Temperature: $_currentTemp, '
        'Current Time: $_currentTime, Sunrise: $_sunrise, Sunset: $_sunset';
  }
}




























