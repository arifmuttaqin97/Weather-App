import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/constant.dart';
import 'package:weather_app/model/current_weather.dart';

class CurrentRepository {
  static Future<Either<String, CurrentWeather>> getCurrentWeather({
    required double lat,
    required double long,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$weatherUrl?lat=$lat&lon=$long&appid=$apiKey&units=metric'),
      );
      if (response.statusCode == 200) {
        return Right(CurrentWeather.fromJson(jsonDecode(response.body)));
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
