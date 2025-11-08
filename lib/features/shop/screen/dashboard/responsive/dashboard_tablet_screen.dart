import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screen/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Sales total',
                      subtitle: '\$256.6',
                      stats: 25,
                    ),
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Sales total',
                      subtitle: '\$256.6',
                      stats: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Sales total',
                      subtitle: '\$256.6',
                      stats: 25,
                    ),
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Sales total',
                      subtitle: '\$256.6',
                      stats: 25,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
