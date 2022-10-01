import 'package:dicoding_restaurant_app/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../data/models/detail_restaurant_model.dart';

class DescriptionRestaurant extends StatelessWidget {
  const DescriptionRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 2,
        ),
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.transparent, darkSecondaryColor],
            ),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                restaurant.description,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
