import 'package:flutter/material.dart';

class Hero {
  final String name;
  final String image;
  final double speed;
  final double health;
  final double attack;
  final Color color;

  Hero({
    required this.name,
    required this.image,
    required this.speed,
    required this.health,
    required this.attack,
    required this.color,
  });
}

// Lista de héroes de ejemplo
class HeroData {
  static final List<Hero> heroes = [
    Hero(
      name: "Spiderman",
      image: "https://i.redd.it/2f97an638ty71.png",
      speed: 85,
      health: 92,
      attack: 78,
      color: Colors.blue,
    ),
    Hero(
      name: "Capitan America",
      image:
          "https://static.wikia.nocookie.net/disney/images/f/fa/Captain-America-AOU-Render.png/revision/latest/thumbnail/width/360/height/360?cb=20180420015558&path-prefix=es",
      speed: 60,
      health: 45,
      attack: 95,
      color: Colors.blue,
    ),
    Hero(
      name: "Thor",
      image:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5007107c-8355-4fbe-bd9b-eddb6324332f/dcwy7ld-32dbc97a-7fc7-46b4-b951-959049c884d8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUwMDcxMDdjLTgzNTUtNGZiZS1iZDliLWVkZGI2MzI0MzMyZlwvZGN3eTdsZC0zMmRiYzk3YS03ZmM3LTQ2YjQtYjk1MS05NTkwNDljODg0ZDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.TQvvvRyqmT-y2nQCIgXfl28iqwQjPT8hhU9T2wJh56w",
      speed: 90,
      health: 60,
      attack: 80,
      color: Colors.green,
    ),
    Hero(
      name: "Venom",
      image:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0f091ec3-dbfb-48b4-b63c-d4af1b16e6dd/dhy2lbk-5e8a0971-f9e5-42ff-be07-dcdb3018a852.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzBmMDkxZWMzLWRiZmItNDhiNC1iNjNjLWQ0YWYxYjE2ZTZkZFwvZGh5Mmxiay01ZThhMDk3MS1mOWU1LTQyZmYtYmUwNy1kY2RiMzAxOGE4NTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VMZ2NbU3XBRPRCkWi-LwcO6q3Pxy-Kw7mXxphyhWR9U",
      speed: 55,
      health: 95,
      attack: 70,
      color: Colors.black,
    ),
    Hero(
      name: "Rocket",
      image:
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5b8d2b12-21e8-4931-8a6d-fb9ecdd60383/dfuexzw-3e0f5548-47c4-4f7a-8a4c-2d2e0b736606.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzViOGQyYjEyLTIxZTgtNDkzMS04YTZkLWZiOWVjZGQ2MDM4M1wvZGZ1ZXh6dy0zZTBmNTU0OC00N2M0LTRmN2EtOGE0Yy0yZDJlMGI3MzY2MDYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.V4PntGkJ6dxhmBTIcfu0FTK76QsPB8z7AeEe3UtqzOA",
      speed: 98,
      health: 40,
      attack: 88,
      color: Colors.black,
    ),
  ];
}
