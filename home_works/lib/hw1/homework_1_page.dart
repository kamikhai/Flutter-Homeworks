import 'package:flutter/material.dart';
import 'package:home_works/hw1/message.dart';

class HomeWork1Page extends StatefulWidget {
  const HomeWork1Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork1PageState createState() => _HomeWork1PageState();
}

class _HomeWork1PageState extends State<HomeWork1Page> {
  final TextEditingController _textEditingController = TextEditingController();
  static const Color lightGray = Color(0xFF7D7D7D);
  static const Color darkGray = Color(0xFF1E1E1E);
  String dropdownValue = 'Маша';

  final List<Message> _messages = [
    Message(name: 'Саша', text: 'Привет'),
    Message(name: 'Маша', text: 'Привет!'),
    Message(name: 'Саша', text: 'Как дела?')
  ];

  void _addToList(String name, String text) {
    setState(() {
      _messages.add(Message(name: name, text: text));
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      appBar: AppBar(
        backgroundColor: darkGray,
        title: Text(widget.title, style: const TextStyle(color: lightGray),),
        shadowColor: Color(0xff585858),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: _messages.map((item) {
                    Container leading = Container(width: 0, height: 0);
                    Container trailing = Container(width: 0, height: 0);
                    if (item.name == 'Саша') {
                      leading = Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Image.asset(
                            'assets/images/man.png',
                          ));
                    } else {
                      trailing = Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Image.asset(
                            'assets/images/woman.png',
                          ));
                    }
                    return ListTile(
                      leading: leading,
                      trailing: trailing,
                      title: Container(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          decoration: const BoxDecoration(
                              color: darkGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            item.text,
                            style: const TextStyle(color: lightGray),
                          )),
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                      child: Container(
                    padding: const EdgeInsets.all(3),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      dropdownColor: darkGray,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: lightGray,
                      ),
                      items: <String>['Маша', 'Саша'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline: Container(height: 0),
                      style: const TextStyle(color: lightGray),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    ),
                  )),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: lightGray),
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Сообщение...',
                        hintStyle:
                            const TextStyle(fontSize: 15, color: lightGray),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(15),
                        fillColor: darkGray,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Icon(
                          Icons.add,
                          color: lightGray,
                        )),
                    onTap: () {
                      _addToList(dropdownValue, _textEditingController.text);
                    },
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
