import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/auth/auth_api.dart';
import 'package:treevana_seller/app/auth/controllers/user_controller.dart';
import 'package:treevana_seller/app/auth/views/welcome_view.dart';
import 'package:treevana_seller/core/constants.dart';

class SettingsView extends StatelessWidget {

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final userCtrl = Get.find<UserController>();
    return Drawer(
      child: Container(
        color: theme.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => DrawerHeader(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.08,
                      backgroundImage: const NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userCtrl.user.value.name,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userCtrl.user.value.email,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text('Profile', style: theme.textTheme.bodyLarge),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: Text('Notifications', style: theme.textTheme.bodyLarge),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: Text('Privacy', style: theme.textTheme.bodyLarge),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: MyConstants.errorColor),
              title: Text(
                'Logout',
                style: theme.textTheme.bodyLarge!.copyWith(color: MyConstants.errorColor),
              ),
              onTap: () async {
                final res = await AuthApi.signOut();
                if (res) {
                  Get.offAll(() => WelcomeView());
                }
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

}