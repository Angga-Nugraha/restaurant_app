import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/detail_provider.dart';
import '../../../provider/result_state.dart';
import '../../home/home_page.dart';
import 'banners_resto.dart';
import 'description_resto.dart';
import 'list_category.dart';
import 'list_menus.dart';
import 'restaurant_place.dart';
import 'review_customer.dart';

class ListDetailRestaurant extends StatelessWidget {
  const ListDetailRestaurant({super.key, required this.id});

  static const routeName = 'detail_page';

  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        var data = state.result.restaurant;
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            BannersRestaurant(restaurant: data),
            RestaurantPlace(restaurant: data),
            DescriptionRestaurant(restaurant: data),
            const Divider(
              thickness: 2,
            ),
            ListCategoryItems(restaurant: data),
            const Divider(
              thickness: 2,
            ),
            ListMenuItems(restaurant: data),
            const Divider(
              thickness: 2,
            ),
            ReviewCustomer(restaurant: data),
            const Divider(
              thickness: 2,
            ),
          ],
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
              onPressed: () => Navigator.pushNamed(context, HomePage.routeName),
              child: const Text('OK'),
            ),
          ],
        );
      } else {
        return const Text('data');
      }
    });
  }
}
