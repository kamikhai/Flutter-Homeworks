import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:home_works/hw1/homework_1_page.dart';
import 'package:flutter/material.dart';
import 'package:home_works/hw2/theme_store.dart';
import 'package:provider/provider.dart';

import 'hw2/homework_2_page.dart';

void main() {
  runApp(MultiProvider(
      providers: [Provider<ThemeStore>(create: (_) => ThemeStore())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<ThemeStore>().themeData,
          home: const MyHomePage(title: 'Homeworks'));
    });
  }
}

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
              context.read<ThemeStore>().changeTheme();
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const HomeWork1Page(title: 'HW1. Widgets')));
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'HW2. API',
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const HomeWork2Page(title: 'HW2. API, MobX')));
                      },
                    ),
                    const ListTile(
                      title: Text(
                        'HW3. Soon...',
                      ),
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
