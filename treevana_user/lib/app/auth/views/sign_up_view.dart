import 'package:email_otp/email_otp.dart';
import 'package:treevana_user/app/auth/controllers/email_verification_controller.dart';
import 'package:treevana_user/app/auth/controllers/sign_up_controller.dart';
import 'package:treevana_user/app/common/controllers/user_controller.dart';
import 'package:treevana_user/app/common/models/user_model.dart';
import 'package:treevana_user/app/auth/views/email_verification_view.dart';
import 'package:treevana_user/app/auth/views/sign_in_view.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/core/helpers.dart';

class SignUpView extends StatelessWidget {

  SignUpView({super.key});

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _password1Ctrl = TextEditingController();
  final _password2Ctrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.08,),
              Center(
                child: Text(
                  'Creating a new account',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: size.height * 0.04,),
              Text(
                'Your name',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex: Hakmi Zohir',
                  hintStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: MyConstants.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: theme.colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyConstants.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _nameCtrl,
                cursorColor: MyConstants.primaryColor,
                style: theme.textTheme.bodyLarge,
                validator: (val) {
                  return val!.isEmpty ? 'Name field cannot be empty!' : null;
                },
              ),
              SizedBox(height: size.height * 0.03,),
              Text(
                'Your email',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex: h_zohir@gmail.com',
                  hintStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: MyConstants.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: theme.colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyConstants.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _emailCtrl,
                cursorColor: MyConstants.primaryColor,
                style: theme.textTheme.bodyLarge,
                keyboardType: TextInputType.emailAddress,
                validator: (val) => MyHelpers.validateEmail(val!),
              ),
              SizedBox(height: size.height * 0.03,),
              Text(
                'Your phone number',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex: 0655173633',
                  hintStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: MyConstants.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyConstants.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _phoneCtrl,
                cursorColor: MyConstants.primaryColor,
                style: theme.textTheme.bodyLarge,
                keyboardType: TextInputType.phone,
                validator: (val) => MyHelpers.validatePhone(val!),
              ),
              SizedBox(height: size.height * 0.03,),
              Text(
                'Your password',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex: age#H2352',
                  hintStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: MyConstants.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: theme.colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyConstants.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _password1Ctrl,
                cursorColor: MyConstants.primaryColor,
                style: theme.textTheme.bodyLarge,
                obscureText: true,
                validator: (val) => MyHelpers.validatePassword(val!, _password2Ctrl.text.trim()),
              ),
              SizedBox(height: size.height * 0.03,),
              Text(
                'Confirm your password',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex: age#H2352',
                  hintStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: MyConstants.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: theme.colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyConstants.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: _password2Ctrl,
                cursorColor: MyConstants.primaryColor,
                style: theme.textTheme.bodyLarge,
                obscureText: true,
                validator: (val) => MyHelpers.validatePassword(val!, _password1Ctrl.text.trim()),
              ),
              SizedBox(height: size.height * 0.04,),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Get.dialog(
                        Center(
                          child: CircularProgressIndicator(
                            color: MyConstants.primaryColor,
                          ),),
                        barrierDismissible: false,
                      );
                      //final res = await EmailOTP.sendOTP(email: _emailCtrl.text.trim());
                      Get.back();
                      if (true) {
                        final user = UserModel(
                          name: _nameCtrl.text.trim(),
                          email: _emailCtrl.text.trim(),
                          password: _password1Ctrl.text.trim(),
                          phone: _phoneCtrl.text.trim(),
                        );
                        Get.find<SignUpController>().user.value = user;
                        Get.put(EmailVerificationController());
                        Get.to(() => EmailVerificationView());
                      } else {
                        MyHelpers.showError('Error sending verification email!');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(size.width * 0.5, size.height * 0.064),
                  ),
                  child: Text(
                    'Sign-up',
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: theme.textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: 'Log-in',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: MyConstants.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap =
                            () => Get.offAll(() => SignInView()),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.1,),
            ],
          ),
        ),
      ),
    );
  }

}