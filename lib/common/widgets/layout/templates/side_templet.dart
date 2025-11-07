import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/responsive_design.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/tablet_layout.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.useLayout = true,
  });
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TResponsiveWidget(
            mobile: (context) => useLayout
                ? MobileLayout(
                    body: mobile,
                  )
                : mobile ?? desktop ?? Container(),
            tablet: (context) => useLayout
                ? TabletLayout(
                    body: tablet ?? desktop,
                  )
                : tablet ?? desktop ?? Container(),
            desktop: (context) => useLayout
                ? DesktopLayout(
                    body: desktop,
                  )
                : desktop ?? Container()));
  }
}
