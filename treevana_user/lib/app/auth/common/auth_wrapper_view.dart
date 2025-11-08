import 'package:treevana_user/app/auth/common/auth_api.dart';
import 'package:treevana_user/app/auth/sign_in/sign_in_view.dart';
import 'package:treevana_user/app/main/home_view.dart';
import 'package:treevana_user/core/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWrapperView extends StatelessWidget {

  const AuthWrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder(
      future: AuthApi.isUserAuthenticated(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: CircularProgressIndicator(
            color: theme.colorScheme.secondary,
          ),);
        }
        final tokenIsValid = snapshot.data!;
        if (tokenIsValid) {
          Get.put(ThemeController());
          return HomeView();
        }
        return SignInView();
      },
    );
  }

}