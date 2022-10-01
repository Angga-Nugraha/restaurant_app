import 'package:dicoding_restaurant_app/data/models/detail_restaurant_model.dart';
import 'package:dicoding_restaurant_app/provider/result_state.dart';
import 'package:flutter/foundation.dart';

import '../data/api/api_service.dart';

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({required this.apiService, required this.id}) {
    _fetchDetailRestaurant();
  }
  late RestaurantDetails _restaurantDetails;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantDetails get result => _restaurantDetails;
  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantDetail = await apiService.restaurantDetail(id);
      if (restaurantDetail.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetails = restaurantDetail;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
