import 'package:dicoding_restaurant_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../data/api/api_service.dart';
import 'components/list_detail_page.dart';
import '../../provider/detail_provider.dart';
import '../widgets/floating_action_button.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/detai_page';
  final String id;
  const DetailRestaurant({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, HomePage.routeName);
          },
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.white,
          ),
        ),
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
              showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                  title: Text('Calls'),
                  content: Text('This is comming soon...'),
                  actions: [],
                ),
              );
            },
            icon: const Icon(Icons.add_ic_call),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ChangeNotifierProvider<DetailProvider>(
            create: (_) => DetailProvider(apiService: ApiService(), id: id),
            child: ListDetailRestaurant(id: id),
          ),
          const SizedBox(height: 100),
        ],
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
