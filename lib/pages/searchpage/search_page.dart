import 'package:dicoding_restaurant_app/pages/searchpage/search_result.dart';
import 'package:flutter/material.dart';

import '../../common/navigation.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController queryC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: const Text(
          'R e s t a u r a n t',
          style: TextStyle(
            fontFamily: 'Samantha',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: queryC,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  constraints: BoxConstraints(maxHeight: 35),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Search Restaurant',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.close)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigation.intentWithData(ResultSearch.routeName, queryC.text);
              },
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    queryC.dispose();
    super.dispose();
  }
}
