import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zartek/core/routes/app_routes.dart';
import 'package:zartek/firebase_options.dart';
import 'package:zartek/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeInjector();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'zartek',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationProvider: AppRoutes.appRoutes.routeInformationProvider,
      routeInformationParser: AppRoutes.appRoutes.routeInformationParser,
      routerDelegate: AppRoutes.appRoutes.routerDelegate,
    );
  }
}
