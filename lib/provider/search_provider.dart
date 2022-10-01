import 'package:dicoding_restaurant_app/provider/result_state.dart';
import 'package:flutter/foundation.dart';

import '../data/api/api_service.dart';
import '../data/models/search_model.dart';

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;
  final String name;

  SearchProvider({required this.apiService, required this.name}) {
    fetchRestaurant();
  }
  late SearchRestaurant _searcRestaurant;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  SearchRestaurant get result => _searcRestaurant;
  ResultState get state => _state;

  Future<dynamic> fetchRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantDetail = await apiService.searchRestaurant(name);
      if (restaurantDetail.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searcRestaurant = restaurantDetail;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
