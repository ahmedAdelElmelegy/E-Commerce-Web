import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/sidebars/side_bar_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class RouteObservable extends GetObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final menuController = Get.put(SideBarController());
    menuController.changeActiveItem(route?.settings.name ?? '');
    if (previousRoute != null) {
      for (var route in TRoutes.sidBarMenuItem) {
        if (route == previousRoute.settings.name) {
          menuController.activeItem.value = route;
        }
      }
    }
  }
}
