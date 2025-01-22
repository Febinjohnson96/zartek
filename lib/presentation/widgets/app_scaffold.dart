import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key, required this.child, this.appDrawer, this.scaffoldKey});
  final Widget child;
  final Widget? appDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: appDrawer,
      body: SafeArea(child: Padding(padding: EdgeInsets.all(12), child: child)),
    );
  }
}
