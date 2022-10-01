import 'package:dicoding_restaurant_app/provider/preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/scheduling_provider.dart';
import '../../utils/notifcation_helper.dart';
import '../detailResto/detail_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings_page';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    // port.listen((_) async => await service.someTask());
    _notificationHelper
        .configureSelectNotificationSubject(DetailRestaurant.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return Material(
            child: SafeArea(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Dark Theme'),
                    trailing: Switch.adaptive(
                      value: provider.isDarkTheme,
                      onChanged: (value) => provider.enableDarkTheme(value),
                    ),
                  ),
                  ListTile(
                    title: const Text('Scheduling Updates'),
                    trailing: Consumer<SchedulingProvider>(
                      builder: (context, scheduled, _) {
                        return Switch.adaptive(
                          value: provider.isDailyUpdatesActive,
                          onChanged: (value) async {
                            scheduled.scheduledUpdate(value);
                            provider.enableDailyUpdates(value);
                            if (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Scheduling active'),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    selectNotificationSubject.close();
  }
}
