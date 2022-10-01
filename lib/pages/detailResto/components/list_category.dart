import 'package:flutter/material.dart';

import '../../../data/models/detail_restaurant_model.dart';

class ListCategoryItems extends StatelessWidget {
  const ListCategoryItems({Key? key, required this.restaurant})
      : super(key: key);
  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: restaurant.categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryItems(context, index);
        },
      ),
    );
  }

  Widget _buildCategoryItems(BuildContext context, int index) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.transparent, Colors.white],
        ),
      ),
      child: Center(
        child: Text(
          '#${restaurant.categories[index].name}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
