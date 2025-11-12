import "package:treevana_user/app/auth/controllers/phone_verification_controller.dart";
import "package:treevana_user/core/constants.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:pinput/pinput.dart";
import 'package:treevana_user/app/auth/views/sign_up_view.dart';

class PhoneNumberVerificationView extends StatelessWidget {

  PhoneNumberVerificationView({super.key});

  final _textCtrl = TextEditingController();
  final _numCtrl = Get.find<PhoneNumberVerificationController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Text(
              'Phone number verification',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.05,),
            Text(
              'Check your messages for the OTP we sent to verify your phone number.',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: MyConstants.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.1),
            Pinput(
              onChanged: (String val) => _numCtrl.changeCode(val),
              controller: _textCtrl,
              length: 5,
              defaultPinTheme: PinTheme(
                textStyle: theme.textTheme.titleLarge,
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.scaffoldBackgroundColor == Colors.white ?
                  MyConstants.lightGrey :
                  MyConstants.darkGrey,
                ),
              ),
              focusedPinTheme: PinTheme(
                textStyle: theme.textTheme.titleLarge,
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.scaffoldBackgroundColor == Colors.white ?
                  MyConstants.lightGrey :
                  MyConstants.grey,
                  border: Border.all(color: theme.colorScheme.secondary),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            RichText(
              text: TextSpan(
                text: 'Didn\'t receive the code? ',
                style: theme.textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: 'Resend again.',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: MyConstants.primaryColor,
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(height: size.height * 0.1,),
            Obx(
                () => ElevatedButton(
                onPressed: () async {
                  if (_numCtrl.isValid) {
                    Get.to(() => SignUpView());
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.5, size.height * 0.064),
                  elevation: 0,
                  backgroundColor: _numCtrl.isValid ?
                  MyConstants.primaryColor :
                  theme.scaffoldBackgroundColor == Colors.white ?
                  MyConstants.lightGrey :
                  MyConstants.darkGrey,
                  side: BorderSide(
                    color: _numCtrl.isValid ?
                    MyConstants.primaryColor :
                    theme.scaffoldBackgroundColor == Colors.white ?
                    MyConstants.grey :
                    MyConstants.lightGrey!,
                  ),
                ),
                child: Text(
                  'Verify',
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: _numCtrl.isValid ?
                    Colors.white :
                    theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}