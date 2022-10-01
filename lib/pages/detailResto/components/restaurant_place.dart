import 'package:dicoding_restaurant_app/common/styles.dart';
import 'package:dicoding_restaurant_app/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../data/models/detail_restaurant_model.dart';

class RestaurantPlace extends StatelessWidget {
  const RestaurantPlace({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isFavorited(restaurant.id),
        builder: (context, snapshot) {
          var isFavorite = snapshot.data ?? false;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 2),
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.transparent, darkSecondaryColor],
              ),
            ),
            child: ListTile(
                title: Text(
                  restaurant.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/rating.svg',
                          height: 20,
                          width: 20,
                        ),
                        Flexible(
                          child: Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 20,
                          color: Colors.black,
                        ),
                        Flexible(
                          child: Text(
                            '${restaurant.address}, ${restaurant.city}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: isFavorite
                    ? Image.asset(
                        'assets/images/img.png',
                        height: 30,
                        width: 30,
                      )
                    : const Text('')),
          );
        },
      );
    });
  }
}
