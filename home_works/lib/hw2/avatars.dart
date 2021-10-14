import 'dart:math';

class Avatars {
  static List<String> avatars = [
    'assets/images/beaver.png',
    'assets/images/bee.png',
    'assets/images/bird.png',
    'assets/images/deer.png',
    'assets/images/elephant.png',
    'assets/images/hamster.png',
    'assets/images/macaw.png',
    'assets/images/toucan.png'
  ];
  static Random random = Random.secure();


  static String getRandomAvatar() {
    return avatars[random.nextInt(avatars.length)];
  }
}
