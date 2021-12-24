import 'package:flutter/material.dart';
import 'package:home_works/hw3/image.dart';

class DetailInfoPage extends StatefulWidget {
  const DetailInfoPage({Key? key, required this.image}) : super(key: key);

  final GalleryImage image;

  @override
  _DetailInfoPageState createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
  static const Color lightGray = Color(0xFF7D7D7D);
  static const Color darkGray = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      appBar: AppBar(
        backgroundColor: darkGray,
        title: SizedBox(
            width: 300,
            child: Center(
              child: Text(
                widget.image.name,
                style: const TextStyle(color: lightGray),
              ),
            ),
          ),
        shadowColor: Color(0xff585858),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
              tag: widget.image.name, child: InteractiveViewer(child: Image.asset(widget.image.url))),
        )),
      ),
    );
  }
}
