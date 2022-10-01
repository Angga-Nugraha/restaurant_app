import 'package:dicoding_restaurant_app/pages/searchpage/search_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/result_state.dart';
import '../../provider/search_provider.dart';
import '../home/home_page.dart';

class ListDetailSearch extends StatelessWidget {
  const ListDetailSearch({super.key, required this.name});
  final String name;

  static const routeName = 'detail_search';

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.noData) {
          return const Material(
            child: Center(
              child: Text('Result not found, try another keyword'),
            ),
          );
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurants = state.result.restaurants[index];
              return SearchRestaurantCard(restaurant: restaurants);
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
        } else {
          return const Material(
            child: Center(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}
