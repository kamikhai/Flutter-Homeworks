import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw2/theme_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            child: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.wb_sunny_outlined)),
            onTap: () {
              Modular.get<ThemeStore>().changeTheme();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: ListTile.divideTiles(context: context, tiles: [
                    ListTile(
                      title: const Text(
                        'HW1. Widgets',
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/hw1');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'HW2. API',
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/hw2');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'HW3. Gallery, Animation',
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/hw3/');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'HW4. Instagram',
                      ),
                      onTap: () {
                        Modular.to.pushReplacementNamed('/hw4/');
                      },
                    ),
                  ]).toList(),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
