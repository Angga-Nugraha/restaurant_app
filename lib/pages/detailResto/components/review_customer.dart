import 'package:dicoding_restaurant_app/data/models/detail_restaurant_model.dart';
import 'package:flutter/material.dart';

class ReviewCustomer extends StatelessWidget {
  const ReviewCustomer({super.key, required this.restaurant});
  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Customer Reviewer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Divider(
          thickness: 1,
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
                colors: [Colors.white, Colors.transparent],
              ),
            ),
            child: ListView.builder(
              itemCount: restaurant.customerReviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(1),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          restaurant.customerReviews[index].name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          restaurant.customerReviews[index].date,
                          style: const TextStyle(
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    '"${restaurant.customerReviews[index].review}"',
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
