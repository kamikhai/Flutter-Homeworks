import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_works/hw4/dto/post_dto.dart';
import 'package:home_works/hw4/model/user.dart';

import '../gradient_border.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<StatefulWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 6.0, right: 6.0),
      child: SizedBox(
        width: 60.0,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(90),
                border: GradientBorder.uniform(
                    width: 3.0,
                    gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        colors: <Color>[
                          Colors.orangeAccent,
                          Colors.pinkAccent
                        ],
                        stops: [
                          0.3,
                          0.8
                        ])),
                image: DecorationImage(
                    image: MemoryImage(
                        base64Decode(widget.user.image)),
                    fit: BoxFit.cover),
              ),
              height: 60,
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 6.0),
              child: Text(
                widget.user.name,
                style: const TextStyle(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}
