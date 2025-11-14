import 'package:treevana_user/app/auth/auth_api.dart';
import 'package:treevana_user/app/auth/controllers/email_verification_controller.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../home/views/home_view.dart';

class EmailVerificationView extends StatelessWidget {

  EmailVerificationView({super.key});

  final _ctrl = Get.find<EmailVerificationController>();

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
            SizedBox(height: size.height * 0.1,),
            Text(
              'Email Address Verification',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.05,),
            Text(
              'Check your emails for the code we sent to verify your email address.',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: MyConstants.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.1,),
            Pinput(
              length: 5,
              onChanged: (val) => _ctrl.changeCode(val),
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
            SizedBox(height: size.height * 0.1,),
            Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.5, size.height * 0.064),
                  backgroundColor: _ctrl.isValid ?
                  MyConstants.primaryColor :
                  theme.scaffoldBackgroundColor == Colors.white ?
                  MyConstants.lightGrey :
                  MyConstants.darkGrey,
                  side: BorderSide(
                    color: _ctrl.isValid ?
                    MyConstants.primaryColor :
                    theme.scaffoldBackgroundColor == Colors.white ?
                    MyConstants.grey :
                    MyConstants.lightGrey!,
                  ),
                ),
                onPressed: () async {
                  if (_ctrl.isValid) {
                    Get.dialog(
                      Center(child: CircularProgressIndicator(
                        color: MyConstants.primaryColor,
                      ),),
                      barrierDismissible: false,
                    );
                    final res = EmailOTP.verifyOTP(otp: _ctrl.code.value);
                    if (res) {
                      //final res = await AuthApi.signUp();
                      Get.back();
                      if (res) {
                        Get.offAll(() => HomeView());
                      }
                    } else {
                      Get.showSnackbar(GetSnackBar(
                        messageText: Text(
                          'Either the code validity has expired or you\'ve '
                          'entered a code that does not match with the one we sent!',
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(seconds: 5),
                        backgroundColor: MyConstants.primaryColor,
                        borderRadius: 10,
                      ));
                    }
                  }
                },
                child: Text(
                  'Verify',
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: _ctrl.isValid ?
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