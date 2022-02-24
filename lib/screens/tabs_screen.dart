import 'package:flutter/material.dart';
import 'package:mymoney_app/routes/app_routes.dart';
import 'package:mymoney_app/screens/persons_screen.dart';
import 'package:mymoney_app/screens/registers_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {'title': 'Pesquisa de Registros', 'screen': RegistersScreen()},
    {'title': 'Pesquisa de Pessoas', 'screen': PersonsScreen()},
  ];

  _selectTab(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  Widget _add() {
    switch (_selectedScreenIndex) {
      case 0:
        return IconButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.registerDetailScreen),
          icon: const Icon(Icons.add),
          iconSize: 30,
        );
      case 1:
        return IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_add,
          ),
          iconSize: 30,
        );
      default:
        return IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
          iconSize: 30,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
        actions: [
          _add(),
        ],
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Registros",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Pessoas",
          )
        ],
      ),
    );
  }
}
