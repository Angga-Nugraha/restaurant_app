import 'package:dicoding_restaurant_app/pages/settings_pages/favorite_page.dart';
import 'package:dicoding_restaurant_app/pages/settings_pages/settings_page.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            width: double.infinity,
            height: 80,
            color: const Color.fromARGB(255, 9, 24, 105),
            child: const Center(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              print('profile');
            },
            child: const DrawerLIst(icon: Icon(Icons.person), title: 'Profile'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, FavoritePage.routeName);
            },
            child:
                const DrawerLIst(icon: Icon(Icons.favorite), title: 'Favorite'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
            child:
                const DrawerLIst(icon: Icon(Icons.settings), title: 'Settings'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              print('logout');
            },
            child: const DrawerLIst(icon: Icon(Icons.logout), title: 'Logout'),
          ),
        ],
      ),
    );
  }
}

class DrawerLIst extends StatelessWidget {
  final Icon icon;
  final String title;
  const DrawerLIst({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: icon,
        ),
        Expanded(
          flex: 2,
          child: Text(title),
        ),
      ],
    );
  }
}
