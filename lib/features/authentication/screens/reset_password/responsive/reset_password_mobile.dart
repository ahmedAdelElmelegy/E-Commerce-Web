import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    String email = Get.parameters['email'] ?? '';

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ResetPasswrodWidget(email: email),
      )),
    );
  }
}
