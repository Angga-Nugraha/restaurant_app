import 'package:dicoding_restaurant_app/pages/searchpage/search_page.dart';
import 'package:flutter/material.dart';

import 'components/header_widget.dart';
import 'components/list_restaurant.dart';
import 'components/my_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'R e s t a u r a n t',
          style: TextStyle(
            fontFamily: 'Samantha',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: ListView(
        children: const [
          HeaderWidget(),
          ListRestaurantPage(),
        ],
      ),
    );
  }
}
