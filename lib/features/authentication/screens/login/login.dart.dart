import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/side_templet.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/responsive/login_desktop_tablet.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/responsive/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: LoginDesktopTablet(),
      mobile: LoginScreenMobile(),
      // tablet: LoginDesktopTablet(),tablet is null take desktop
    );
  }
}
