import 'package:treevana_user/app/auth/controllers/sign_up_controller.dart';
import 'package:treevana_user/app/auth/views/sign_up_view.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/auth/views/sign_in_view.dart';

class WelcomeView extends StatelessWidget {

  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.3,),
            //Image.asset('assets/images/logo.png'),
            RichText(
              text: TextSpan(
                text: 'Welcome to ',
                style: theme.textTheme.headlineMedium,
                children: [
                  TextSpan(
                    text: 'Treevana',
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: MyConstants.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03,),
            Text(
              'Sign in or create an account to start!',
              style: theme.textTheme.bodyLarge!,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.15,),
            ElevatedButton(
              onPressed: () {
                Get.put(SignUpController());
                Get.to(() => SignUpView());
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(size.width * 0.6, size.height * 0.064),
              ),
              child: Text(
                'Create an account',
                style: theme.textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03,),
            ElevatedButton(
              onPressed: () => Get.to(() => SignInView()),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: theme.scaffoldBackgroundColor,
                foregroundColor: theme.colorScheme.secondary,
                fixedSize: Size(size.width * 0.6, size.height * 0.064),
                side: BorderSide(color: MyConstants.primaryColor, width: 2),
              ),
              child: Text(
                'Log-in',
                style: theme.textTheme.titleSmall!.copyWith(
                  color: MyConstants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}