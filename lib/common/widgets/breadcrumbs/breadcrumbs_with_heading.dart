import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/page_heading.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class BreadcrumbsWithHeading extends StatelessWidget {
  const BreadcrumbsWithHeading(
      {super.key,
      required this.heading,
      required this.breadcrumbsScreen,
      this.returnToPreviousScreen = false});
  final String heading;
  final List<String> breadcrumbsScreen;
  final bool returnToPreviousScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(TRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.apply(fontSizeDelta: -1),
                ),
              ),
            ),
            for (int i = 0; i < breadcrumbsScreen.length; i++)
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('/'),
                  InkWell(
                    onTap: i == breadcrumbsScreen.length - 1
                        ? null
                        : () => Get.toNamed(breadcrumbsScreen[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.xs),
                      child: Text(
                        i == breadcrumbsScreen.length - 1
                            ? breadcrumbsScreen[i].capitalize.toString()
                            : capitalize(breadcrumbsScreen[i]).substring(1),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.apply(fontSizeDelta: -1),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back)),
            if (returnToPreviousScreen)
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
            TPageHeading(heading: heading)
          ],
        )
      ],
    );
  }

  String capitalize(String input) {
    return input.isEmpty ? '' : input[0].toUpperCase() + input.substring(1);
  }
}
