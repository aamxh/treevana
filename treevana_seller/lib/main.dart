import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:treevana_seller/app/auth/views/auth_wrapper_view.dart';
import 'package:treevana_seller/core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AuthWrapperView(),
      title: 'Treevana',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
    );
  }

}