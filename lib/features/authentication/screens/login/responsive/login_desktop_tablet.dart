import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/login_template.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_form.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_header.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(' size & orientation: ${MediaQuery.of(context).size.width}');
    return const LoginTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          LoginHeader(),
          // form
          LoginForm(),
        ],
      ),
    );
  }
}
