import 'package:flutter/material.dart';
import 'dart:math';

class NameColors {
  static List<Color> lightColors = [
    const Color(0xffef9a9a),
    const Color(0xffff5252),
    const Color(0xffff1744),
    const Color(0xffff4081),
    const Color(0xffce93d8),
    const Color(0xffaa00ff),
    const Color(0xffe040fb),
    const Color(0xff7c4dff),
    const Color(0xff7986cb),
    const Color(0xff536dfe),
    const Color(0xff2196f3),
    const Color(0xff2962ff),
    const Color(0xff80d8ff),
    const Color(0xff18ffff),
    const Color(0xff00acc1),
    const Color(0xff26a69a),
    const Color(0xff00bfa5),
    const Color(0xff4caf50),
    const Color(0xff00e676),
    const Color(0xff81c784),
    const Color(0xffccff90),
    const Color(0xffcddc39),
    const Color(0xffaeea00),
    const Color(0xfff9a825),
    const Color(0xffffff00),
    const Color(0xfffff176),
    const Color(0xfffb8c00)
  ];

  static List<Color> darkColors = [
    const Color(0xffb71c1c),
    const Color(0xff880e4f),
    const Color(0xff6a1b9a),
    const Color(0xff4a148c),
    const Color(0xff6200ea),
    const Color(0xff512da8),
    const Color(0xff1a237e),
    const Color(0xff304ffe),
    const Color(0xff0d47a1),
    const Color(0xff00838f),
    const Color(0xff00796b),
    const Color(0xff004d40),
    const Color(0xff388e3c),
    const Color(0xff1b5e20),
    const Color(0xff689f38),
    const Color(0xff33691e),
    const Color(0xff9e9d24),
    const Color(0xff827717),
    const Color(0xfff9a825),
    const Color(0xfff57f17),
    const Color(0xffff6f00),
    const Color(0xffe65100),
    const Color(0xffbf360c),
    const Color(0xff6d4c41),
    const Color(0xff4e342e),
    const Color(0xff455a64),
    const Color(0xff546e7a)
  ];
  static Random random = Random.secure();

  static Color getRandomColor(bool dark) {
    return dark
        ? lightColors[random.nextInt(lightColors.length)]
        : darkColors[random.nextInt(darkColors.length)];
  }
}
