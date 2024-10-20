import 'dart:convert';

import 'package:dio/dio.dart';

import '../features/dashboard/follow order/model/model2.dart';

class DistanceService {
  final Dio dio;

  DistanceService(this.dio);

  Future<Routes?> fetchDistanceAndDuration(String destination) async {
    //damietta
    try {
      final response = await dio.get(
          'https://maps.gomaps.pro/maps/api/directions/json?destination=$destination&origin=damietta&key=AlzaSyFeGmcsOLJWPMqKayHMZGvbRpatKPFvYSe');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>?;
        if (data != null && (data['routes'] as List).isNotEmpty) {
          return Routes.fromJson(data['routes'].first);
        } else {
          print('Error: No address found');
        }
      } else {
        print(
            'Error: Failed to fetch data with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
