import 'package:dicoding_restaurant_app/pages/detailResto/detail_page.dart';
import 'package:dicoding_restaurant_app/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common/navigation.dart';
import '../../../data/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(restaurant.id),
          builder: (context, snapshot) {
            var isFavorite = snapshot.data ?? false;
            return Material(
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  leading: Hero(
                    tag: restaurant.pictureId,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black],
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          restaurant.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/rating.svg',
                            height: 20,
                            width: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_pin,
                            size: 20,
                          ),
                          Flexible(
                            child: Text(
                              restaurant.city,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: isFavorite
                      ? IconButton(
                          icon: const Icon(Icons.favorite),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () =>
                              provider.removeRestaurant(restaurant.id),
                        )
                      : IconButton(
                          icon: const Icon(Icons.favorite_border),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () => provider.addFavorite(restaurant),
                        ),
                  onTap: () => Navigation.intentWithData(
                      DetailRestaurant.routeName, restaurant.id)),
            );
          },
        );
      },
    );
  }
}
