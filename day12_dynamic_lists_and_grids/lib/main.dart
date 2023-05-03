import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final _users = List.filled(100, "Flutter App");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Text("List View"),
                Text("Grid View"),
              ],
            ),
          ),
          body: TabBarView(children: [
            _listView(),
            _gridView(),
          ]),
        ),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            _users[index],
          ),
        ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(itemCount: _users.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Card(
        child: GridTile(
          child: Center(
            child: Text(
           _users[index],
            ),
          ),
        ),
      ),
    );
  }
}