import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/sidebars/side_bar_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  const TMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SideBarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
        () => Container(
          margin: const EdgeInsets.symmetric(vertical: TSizes.xs),
          decoration: BoxDecoration(
              color: menuController.isHover(route) ||
                      menuController.isActive(route)
                  ? TColors.primary
                  : TColors.white,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // icon

              Padding(
                padding: const EdgeInsets.only(
                    left: TSizes.lg,
                    top: TSizes.md,
                    bottom: TSizes.md,
                    right: TSizes.md),
                child: Icon(icon,
                    color: menuController.isHover(route) ||
                            menuController.isActive(route)
                        ? TColors.white
                        : TColors.darkGrey),
              ),
              // title

              Flexible(
                child: Text(title,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: menuController.isHover(route) ||
                                menuController.isActive(route)
                            ? TColors.white
                            : TColors.darkGrey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
