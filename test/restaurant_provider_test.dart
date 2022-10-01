import 'package:dicoding_restaurant_app/data/api/api_service.dart';
import 'package:dicoding_restaurant_app/data/models/restaurant_model.dart';
import 'package:dicoding_restaurant_app/data/models/search_model.dart';
import 'package:dicoding_restaurant_app/provider/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/provider/search_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'restaurant_provider_test.mocks.dart';

@GenerateMocks([ApiService])
void main() async {
  late RestaurantProvider restaurantProvider;
  late SearchProvider searchRestaurantProvider;
  late ApiService apiService;

  var restaurantTest = {
    "id": "rqdv5juczeskfw1e867",
    "name": "Melting Pot",
    "description":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
    "pictureId": "14",
    "city": "Medan",
    "rating": 4.2
  };

  var searchRestaurantTest = {
    "id": "fnfn8mytkpmkfw1e867",
    "name": "Makan mudah",
    "description":
        "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
    "pictureId": "22",
    "city": "Medan",
    "rating": 3.7
  };

  group('Restaurant Provider Test', () {
    setUp(() {
      // ARRANGE
      apiService = MockApiService();
      var apiResponse = {
        'error': false,
        'message': 'success',
        'count': 1,
        'restaurants': [
          {
            "id": "rqdv5juczeskfw1e867",
            "name": "Melting Pot",
            "description":
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
            "pictureId": "14",
            "city": "Medan",
            "rating": 4.2
          },
        ]
      };

      when(apiService.restaurantList())
          .thenAnswer((_) async => RestaurantResult.fromJson(apiResponse));

      restaurantProvider = RestaurantProvider(apiService: apiService);
    });

    test('Memerika daftar restaurant jika sesuai dengan data restaurant test',
        () async {
      // ACT
      await restaurantProvider.fetchAllRestaurant();

      // ASSERT
      var result = restaurantProvider.result.restaurants[0];
      var jsonRestaurant = Restaurant.fromJson(restaurantTest);

      expect(result.id == jsonRestaurant.id, true);
      expect(result.name == jsonRestaurant.name, true);
      expect(result.city == jsonRestaurant.city, true);
      expect(result.description == jsonRestaurant.description, true);
      expect(result.pictureId == jsonRestaurant.pictureId, true);
      expect(result.rating == jsonRestaurant.rating, true);
    });

    setUp(() {
      // ARRANGE
      apiService = MockApiService();
      var searchRestaurant = 'Makan Mudah';
      var searchResponse = {
        "error": false,
        "founded": 1,
        "restaurants": [
          {
            "id": "fnfn8mytkpmkfw1e867",
            "name": "Makan mudah",
            "description":
                "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
            "pictureId": "22",
            "city": "Medan",
            "rating": 3.7
          }
        ]
      };

      when(apiService.searchRestaurant(searchRestaurant))
          .thenAnswer((_) async => SearchRestaurant.fromJson(searchResponse));

      searchRestaurantProvider =
          SearchProvider(apiService: apiService, name: searchRestaurant);
    });

    test(
        'Mencari daftar restaurant berdasarkan nama atau menu jika sesuai dengan data restaurant',
        () async {
      // ACT
      await searchRestaurantProvider.fetchRestaurant();

      // ASSERT
      var result = searchRestaurantProvider.result.restaurants[0];
      var jsonSearchRestaurant =
          RestaurantSearch.fromJson(searchRestaurantTest);
      expect(result.name == jsonSearchRestaurant.name, true);
    });
  });
}
