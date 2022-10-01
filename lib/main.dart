import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dicoding_restaurant_app/common/navigation.dart';
import 'package:dicoding_restaurant_app/data/api/api_service.dart';
import 'package:dicoding_restaurant_app/provider/database_provider.dart';
import 'package:dicoding_restaurant_app/provider/preferences_provider.dart';
import 'package:dicoding_restaurant_app/provider/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/provider/scheduling_provider.dart';
import 'package:dicoding_restaurant_app/utils/background_service.dart';
import 'package:dicoding_restaurant_app/utils/notifcation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/database/database_helper.dart';
import 'data/preference/preference_helper.dart';
import 'pages/detailResto/detail_page.dart';
import 'pages/settings_pages/favorite_page.dart';
import 'pages/home/home_page.dart';
import 'pages/searchpage/search_page.dart';
import 'pages/searchpage/search_result.dart';
import 'pages/settings_pages/settings_page.dart';
import 'pages/widgets/splash_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 5)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => RestaurantProvider(
                  apiService: ApiService(),
                ),
              ),
              ChangeNotifierProvider(create: (_) => SchedulingProvider()),
              ChangeNotifierProvider(
                create: (_) => PreferencesProvider(
                  preferencesHelper: PreferencesHelper(
                    sharedPreferences: SharedPreferences.getInstance(),
                  ),
                ),
              ),
              ChangeNotifierProvider(
                create: (_) => DatabaseProvider(
                  databaseHelper: DatabaseHelper(),
                ),
              ),
            ],
            child: Consumer<PreferencesProvider>(
              builder: (context, value, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigatorKey,
                  title: 'Restaurant App',
                  theme: value.themeData,
                  initialRoute: HomePage.routeName,
                  routes: {
                    HomePage.routeName: (context) => const HomePage(),
                    DetailRestaurant.routeName: (context) => DetailRestaurant(
                          id: ModalRoute.of(context)?.settings.arguments
                              as String,
                        ),
                    SearchPage.routeName: (context) => const SearchPage(),
                    ResultSearch.routeName: (context) => ResultSearch(
                          name: ModalRoute.of(context)?.settings.arguments
                              as String,
                        ),
                    SettingsPage.routeName: (context) => const SettingsPage(),
                    FavoritePage.routeName: (context) => const FavoritePage(),
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
