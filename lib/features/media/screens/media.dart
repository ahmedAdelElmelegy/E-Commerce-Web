import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/side_templet.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/responsive/media_desktop_screen.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/responsive/media_mobile_screen.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/responsive/media_tablet_screen.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: TSiteTemplate(
      mobile: MediaMobileScreen(),
      tablet: MediaTabletScreen(),
      desktop: MediaDesktopScreen(),
    ));
  }
}
