import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/side_templet.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screen/dashboard/responsive/dashboard_desktop_screen.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screen/dashboard/responsive/dashboard_mobile_screen.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screen/dashboard/responsive/dashboard_tablet_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      mobile: DashboardMobileScreen(),
      tablet: DashboardTabletScreen(),
      desktop: DashboardDesktopScreen(),
    );
  }
}
