import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/api/api_service.dart';
import '../../provider/search_provider.dart';
import 'search_list.dart';

class ResultSearch extends StatelessWidget {
  static const routeName = '/result';
  const ResultSearch({super.key, required this.name});
  final String name;

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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ChangeNotifierProvider<SearchProvider>(
            create: (_) => SearchProvider(apiService: ApiService(), name: name),
            child: ListDetailSearch(name: name),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
