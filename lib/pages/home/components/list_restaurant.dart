import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/restaurant_provider.dart';
import '../../../provider/result_state.dart';
import '../home_page.dart';
import 'restaurant_card.dart';

class ListRestaurantPage extends StatelessWidget {
  const ListRestaurantPage({Key? key}) : super(key: key);
  static const routeName = '/restaurant_page';

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurants = state.result.restaurants[index];
              return RestaurantCard(restaurant: restaurants);
            },
          );
        } else if (state.state == ResultState.error) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Your Connection lost'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, HomePage.routeName),
                child: const Text('OK'),
              ),
            ],
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}
