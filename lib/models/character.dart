import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final List<Color> colors;

  Character(
      {required this.name, required this.imagePath, required this.colors});
}

List characters = [
  Character(
      name: "Tatooine",
      imagePath: "assets/images/Tatooine.webp",
      colors: [const Color(0xff659999), const Color(0xfff4791f)]),
  Character(
      name: "Alderaan",
      imagePath: "assets/images/alderaan_planet.png",
      colors: [const Color(0xffbdc3c7), const Color(0xff2c3e50)]),
  Character(
      name: "Yavin IV",
      imagePath: "assets/images/yavin_planet.png",
      colors: [const Color(0xff2C5364), const Color(0xff0F2027)]),
  Character(
      name: "Hoth",
      imagePath: "assets/images/hoth_planet.png",
      colors: [const Color(0xff525252), const Color(0xff3d72b4)]),
];
