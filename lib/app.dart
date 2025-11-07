import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/templates/side_templet.dart';
import 'package:yt_ecommerce_admin_panel/routes/app_route.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/Bindings/general_bindings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'utils/constants/text_strings.dart';
import 'utils/device/web_material_scroll.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      getPages: TAppRoute.pages,
      initialRoute: TRoutes.dashboard,
      initialBinding: GeneralBindings(),
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const Scaffold(
            body: Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(color: TColors.error),
          ),
        )),
      ),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    debugPrint(width.toString());
    return const TSiteTemplate(
      mobile: Mobile(),
      tablet: Tablet(),
      desktop: Desktop(),
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tablet'),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Mobile'),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: PaginatedDataTable2(
            columnSpacing: 12,
            minWidth: 786, //for mobile
            dividerThickness: 0,
            horizontalMargin: 12,
            dataRowHeight: 56,
            rowsPerPage: 12,
            headingTextStyle: Theme.of(context).textTheme.titleMedium,
            headingRowColor:
                WidgetStateProperty.resolveWith((state) => TColors.white),
            headingRowDecoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.borderRadiusMd),
                    topRight: Radius.circular(TSizes.borderRadiusMd))),

            showCheckboxColumn: true,

            columns: const [
              DataColumn2(
                label: Text('Column 1'),
                // numeric: true,
              ),
              DataColumn(label: Text('Column 2')),
              DataColumn(label: Text('Column 3')),
              DataColumn(label: Text('Column 4')),
            ],
            source: MyData(),
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final DashboardController controller = Get.put(DashboardController());
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(Text(controller.dataList[index]['Column 1'] ?? '')),
      DataCell(Text(controller.dataList[index]['Column 2'] ?? '')),
      DataCell(Text(controller.dataList[index]['Column 3'] ?? '')),
      DataCell(Text(controller.dataList[index]['Column 4'] ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.dataList.length;

  @override
  int get selectedRowCount => 0;
}

class DashboardController extends GetxController {
  var dataList = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    fetchDummyData();
    super.onInit();
  }

  void fetchDummyData() {
    dataList.addAll(List.generate(
        36,
        (index) => {
              'Column 1': 'Data   ${index + 1}-1',
              'Column 2': 'Data  ${index + 1}-2',
              'Column 3': 'Data  ${index + 1}-3',
              'Column 4': 'Data  ${index + 1}-4',
            }));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('First Screen'),
    );
  }
}
