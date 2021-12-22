import 'package:flutter/material.dart';
import 'package:mymoney_app/routes/app_routes.dart';
import 'package:mymoney_app/screens/register_detail_screen.dart';
import 'package:mymoney_app/screens/registers_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.registersScreen: (ctx) => RegistersScreen(),
        AppRoutes.registerDetailScreen: (ctx) => RegisterDetailScreen(),
      },
    );
  }
}
