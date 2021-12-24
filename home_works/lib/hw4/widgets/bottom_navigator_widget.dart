import 'package:flutter/material.dart';

import '../instagram_icons_icons.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 25,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            InstagramIcons.home,
            color: Colors.white,
          ),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(InstagramIcons.search, color: Colors.white),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(InstagramIcons.instagram_reel, color: Colors.white),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(InstagramIcons.like, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 25.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border: Border.all(width: 1.2, color: Colors.black),
                image: const DecorationImage(
                    image: AssetImage('assets/images/avatars/photo1.jpeg'),
                    fit: BoxFit.cover),
              ),
              height: 25,
            ),
          ),
          label: '',
        )
      ],
    );
  }
}
