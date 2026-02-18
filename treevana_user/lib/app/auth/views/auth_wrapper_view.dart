import 'package:treevana_user/app/auth/auth_api.dart';
import 'package:treevana_user/app/auth/controllers/user_controller.dart';
import 'package:treevana_user/app/auth/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/home/controllers/home_controller.dart';
import 'package:treevana_user/app/home/views/home_view.dart';
import 'package:treevana_user/app/orders/controllers/orders_controller.dart';
import 'package:treevana_user/app/products/controllers/products_controller.dart';
import 'package:treevana_user/core/helpers.dart';

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
            color: theme.primaryColor,
          ),);
        }
        final tokenIsValid = snapshot.data!;
        if (tokenIsValid) return HomeView();
        return WelcomeView();
      },
    );
  }

}