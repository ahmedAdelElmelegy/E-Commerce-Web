import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/login_template.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget {
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    String email = Get.parameters['email'] ?? '';
    return LoginTemplate(
      child: ResetPasswrodWidget(email: email),
    );
  }
}
