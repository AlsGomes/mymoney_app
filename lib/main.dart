import 'package:flutter/material.dart';
import 'package:mymoney_app/model/register_list.dart';
import 'package:mymoney_app/routes/app_routes.dart';
import 'package:mymoney_app/screens/register_detail_screen.dart';
import 'package:mymoney_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (ctx) => TabsScreen(),
          AppRoutes.registerDetailScreen: (ctx) => RegisterDetailScreen(),
        },
      ),
    );
  }
}
