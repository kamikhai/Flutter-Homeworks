import 'package:home_works/homework_1_page.dart';
import 'package:flutter/material.dart';

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
          appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        shadowColor: Color(0xFF2B2B2B),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
      )),
      home: const MyHomePage(title: 'Homeworks'),
    );
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
      backgroundColor: const Color(0x00000000),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: ListTile.divideTiles(
                      context: context,
                      color: const Color(0xFF7D7D7D),
                      tiles: [
                        ListTile(
                          title: const Text(
                            'HW1. Widgets',
                            style: TextStyle(color: Color(0xFF7D7D7D)),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeWork1Page(
                                    title: 'HW1. Widgets')));
                          },
                        ),
                        const ListTile(
                          title: Text(
                            'HW2. Soon...',
                            style: TextStyle(color: Color(0xFF7D7D7D)),
                          ),
                        ),
                        const ListTile(
                          title: Text(
                            'HW3. Soon...',
                            style: TextStyle(color: Color(0xFF7D7D7D)),
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
