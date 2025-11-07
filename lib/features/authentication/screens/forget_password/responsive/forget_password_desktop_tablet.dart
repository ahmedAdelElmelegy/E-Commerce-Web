import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/login_template.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/forget_password_form.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/forget_password_header.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class ForgetPasswordScreenDesktopTablet extends StatelessWidget {
  const ForgetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ForgetPasswordHeader(),
          // form
          ForgetPasswordForm(),
        ],
      ),
    );
  }
}
