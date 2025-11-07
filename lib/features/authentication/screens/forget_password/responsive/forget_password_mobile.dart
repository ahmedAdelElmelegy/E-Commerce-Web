import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/forget_password_form.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/forget_password_header.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ForgetPasswordScreenMobile extends StatelessWidget {
  const ForgetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ForgetPasswordHeader(),
            // form
            ForgetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
