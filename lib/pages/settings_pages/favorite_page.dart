import 'package:dicoding_restaurant_app/pages/home/components/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/navigation.dart';
import '../../provider/database_provider.dart';
import '../../provider/result_state.dart';

class FavoritePage extends StatelessWidget {
  static const String title = 'Favorite';
  static const routeName = '/favorite_page';

  const FavoritePage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: provider.favorite.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: provider.favorite[index]);
            },
          );
        } else {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(provider.message),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigation.back(),
                child: const Text('OK'),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: _buildList(),
    );
  }
}
