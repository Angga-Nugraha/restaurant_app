import 'package:dicoding_restaurant_app/data/models/restaurant_model.dart';
import 'package:dicoding_restaurant_app/data/models/search_model.dart';
import 'package:dicoding_restaurant_app/provider/result_state.dart';
import 'package:flutter/foundation.dart';

import '../data/database/database_helper.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorite();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _favorite = [];
  List<Restaurant> get favorite => _favorite;

  void addFavorite(Restaurant restaurants) async {
    try {
      await databaseHelper.insertFavorite(restaurants);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  void addFavoriteFromSearch(RestaurantSearch restaurants) async {
    try {
      await databaseHelper.insertFavoriteFromSearch(restaurants);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favoriteRestaurant = await databaseHelper.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  void removeRestaurant(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  void _getFavorite() async {
    _favorite = await databaseHelper.getFavorite();
    if (_favorite.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }
}
