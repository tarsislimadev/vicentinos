import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Vicentinos v0.1'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person_2)),
                Tab(icon: Icon(Icons.other_houses)),
                Tab(icon: Icon(Icons.calendar_month)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PeopleWidget(),
              Icon(Icons.other_houses),
              Icon(Icons.calendar_month),
            ],
          ),
        ),
      ),
    );
  }
}

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ListView(children: [
      PersonWidget(name: 'A'),
      PersonWidget(name: 'B'),
      PersonWidget(name: 'C'),
      PersonWidget(name: 'D'),
    ]));
  }
}

class PersonWidget extends ListTile {
  const PersonWidget({String name = 'person', Key? key})
      : super(key: key, title: const Text('$name'));
}
