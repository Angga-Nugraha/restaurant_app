import 'package:flutter/material.dart';

import '../../../data/models/detail_restaurant_model.dart';

class BannersRestaurant extends StatelessWidget {
  const BannersRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Hero(
          tag: restaurant.pictureId,
          child: Card(
            color: Colors.white54,
            shadowColor: Colors.indigo,
            elevation: 11,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
