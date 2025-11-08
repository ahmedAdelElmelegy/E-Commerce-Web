import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class SideBarController extends GetxController {
  final activeItem = TRoutes.dashboard.obs;
  final hoverItem = ''.obs;
  void changeActiveItem(String route) {
    activeItem.value = route;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   changeActiveItem(TRoutes.dashboard);
  // }

  // change hover item
  void changeHoverItem(String route) {
    if (!isActive(route)) {
      hoverItem.value = route;
    }
  }

  bool isHover(String route) => hoverItem.value == route;

  bool isActive(String route) => activeItem.value == route;

  // menu on tap
  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);
      if (TDeviceUtils.isMobileScreen(Get.context!)) Get.back();
      Get.toNamed(route);
    }
  }
}
