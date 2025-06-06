import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techtaste/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurant() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantData = data['restaurants'];

    for (var restaurantData in restaurantData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurant.add(restaurant);
    }
  }
}
