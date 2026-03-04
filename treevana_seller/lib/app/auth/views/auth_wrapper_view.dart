import 'package:treevana_seller/app/auth/auth_api.dart';
import 'package:treevana_seller/app/auth/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:treevana_seller/app/home/views/home_view.dart';

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