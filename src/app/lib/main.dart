import 'package:flutter/material.dart';
import './texts/home.dart';
import './texts/business.dart';
import './texts/school.dart';
import './texts/vicentinos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vicentinos v0.1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
      
  static const List<Widget> _widgetOptions = <Widget>[
    TextHome(),
    TextBusiness(),
    TextSchool(),
  ];

  void _onItemTapped(int index) {
    setState(() { _selectedIndex = index; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextVicentinos(),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); }
            );
          },
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: TextVicentinos()),
            ListTile(
              title: const TextHome(),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const TextBusiness(),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const TextSchool(),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
