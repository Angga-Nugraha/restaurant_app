import 'dart:convert';

import 'package:dicoding_restaurant_app/data/models/detail_restaurant_model.dart';
import 'package:http/http.dart' as http;
import '../models/restaurant_model.dart';
import '../models/search_model.dart';

class ApiService {
  static const String baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String searchUrl =
      'https://restaurant-api.dicoding.dev/search?q=';
  static const String detailUrl = 'https://restaurant-api.dicoding.dev/detail/';

  Future<RestaurantResult> restaurantList() async {
    final response = await http.get(Uri.parse('${baseUrl}list'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data restaurant');
    }
  }

  Future<RestaurantDetails> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse(detailUrl + id));
    if (response.statusCode == 200) {
      return RestaurantDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data restaurant');
    }
  }

  Future<SearchRestaurant> searchRestaurant(String name) async {
    final response = await http.get(Uri.parse(searchUrl + name));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data restaurant');
    }
  }
}
