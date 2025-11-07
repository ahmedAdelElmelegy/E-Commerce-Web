import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TResponsiveWidget extends StatelessWidget {
  const TResponsiveWidget(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});
  final WidgetBuilder mobile;
  final WidgetBuilder tablet;
  final WidgetBuilder desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= TSizes.desktopScreenSize) {
        return desktop(context);
      } else if (constraints.maxWidth < TSizes.desktopScreenSize &&
          constraints.maxWidth >= TSizes.tabletScreenSize) {
        return tablet(context);
      } else {
        return mobile(context);
      }
    });
  }
}
