import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:home_works/hw3/grid_store.dart';
import 'package:home_works/hw3/image.dart';
import 'package:home_works/hw3/images_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class HomeWork3Page extends StatefulWidget {
  const HomeWork3Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork3PageState createState() => _HomeWork3PageState();
}

class _HomeWork3PageState extends State<HomeWork3Page> {
  static const Color lightGray = Color(0xFF7D7D7D);
  static const Color darkGray = Color(0xFF1E1E1E);

  GridStore gridStore = Modular.get<GridStore>();
  ImagesStore imagesStore = Modular.get<ImagesStore>();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      appBar: AppBar(
        backgroundColor: darkGray,
        title: Text(
          widget.title,
          style: const TextStyle(color: lightGray),
        ),
        shadowColor: Color(0xff585858),
        actions: [
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Observer(builder: (context) {
                  return gridStore.gridIcon;
                })),
            onTap: () {
              gridStore.changeGridSize();
              gridStore.changeIcon();
            },
          )
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        openCloseDial: isDialOpen,
        backgroundColor: darkGray,
        overlayColor: lightGray,
        overlayOpacity: 0.5,
        spacing: 15,
        spaceBetweenChildren: 15,
        children: [
          SpeedDialChild(
              child: Icon(Icons.image),
              label: 'Загрузить из галереи',
              onTap: () {
                imagesStore.getFromGallery();
              }),
          SpeedDialChild(
              child: Icon(Icons.camera_alt),
              label: 'Сделать фото',
              onTap: () {
                imagesStore.getFromCamera();
              }),
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(builder: (context) {
            return GridView.count(
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: gridStore.gridSize,
              children: imagesStore.images.reversed.map((item) {
                return GestureDetector(
                  child: Hero(
                    tag: item.name,
                    child: Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item.url), fit: BoxFit.cover),
                    )),
                  ),
                  onTap: () {
                    Modular.to.pushNamed('/hw3/detail', arguments: item);
                  },
                );
              }).toList(),
            );
          }),
        )),
      ),
    );
  }
}
