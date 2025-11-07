import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/headers/header.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/sidebars/side_bar.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key, this.body});
  final Widget? body;

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const TSideBar(),
      appBar: THeader(scaffoldKey: _scaffoldKey),
      body: widget.body ?? const SizedBox(),
    );
  }
}
