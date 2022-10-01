import 'package:flutter/material.dart';

import '../../../common/styles.dart';
import '../../../data/models/detail_restaurant_model.dart';

class ListMenuItems extends StatelessWidget {
  const ListMenuItems({Key? key, required this.restaurant}) : super(key: key);
  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Foods:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 75,
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: restaurant.menus.foods.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white54,
                  margin: const EdgeInsets.all(5),
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            restaurant.menus.foods[index].name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Rp. 200.000',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Text(
            'Drinks:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 75,
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: restaurant.menus.drinks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white54,
                  margin: const EdgeInsets.all(5),
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black54, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            restaurant.menus.drinks[index].name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                          child: Text(
                            'Rp. 200.000',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
