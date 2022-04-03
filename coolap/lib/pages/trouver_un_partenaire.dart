import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_run)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.waves)),
              ],
            ),
            title: Center(child: const Text('Sport')),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_run),
              Icon(Icons.directions_bike),
              Icon(Icons.waves),
            ],
          ),
        ),
      ),
    );
  }
}
