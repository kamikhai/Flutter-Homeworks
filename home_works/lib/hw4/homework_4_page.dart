import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw4/widgets/bottom_navigator_widget.dart';
import 'package:home_works/hw4/store/carousel_store.dart';
import 'package:home_works/hw4/database_helper.dart';
import 'package:home_works/hw4/dto/post_dto.dart';
import 'package:home_works/hw4/store/images_store.dart';
import 'package:home_works/hw4/model/user.dart';
import 'package:home_works/hw4/widgets/post_bottom_widget.dart';
import 'package:home_works/hw4/widgets/post_header_widget.dart';
import 'package:home_works/hw4/widgets/post_likes_widget.dart';
import 'package:home_works/hw4/widgets/story_widget.dart';

import 'gradient_border.dart';
import 'instagram_icons_icons.dart';

class HomeWork4Page extends StatefulWidget {
  const HomeWork4Page({Key? key}) : super(key: key);

  @override
  _HomeWork4PageState createState() => _HomeWork4PageState();
}

class _HomeWork4PageState extends State<HomeWork4Page> {
  CarouselStore carouselStore = Modular.get<CarouselStore>();
  ImagesStore imagesStore = Modular.get<ImagesStore>();

  void _updateImageIndex(int index, CarouselPageChangedReason reason) {
    carouselStore.updateIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              'Instagram',
              style: TextStyle(
                  fontFamily: 'Billabong', color: Colors.white, fontSize: 35),
            ),
          ),
        ),
        shadowColor: null,
        actions: [
          GestureDetector(
            child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        child: const Icon(
                          InstagramIcons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        onTap: () async {
                          await imagesStore.getFromGallery();
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        InstagramIcons.direct,
                        size: 50,
                      ),
                    ),
                  ],
                )),
            onTap: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              FutureBuilder<List<User>>(
                  future: DatabaseHelper.instance.getStoriesUsers(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<User>> snapshot) {
                    List<Widget> children = List.of([]);
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      snapshot.data!
                          .map((e) => children.add(StoryWidget(user: e)))
                          .toList();
                    }
                    return SizedBox(
                        height: 80,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: children));
                  }),
              Observer(
                builder: (context) {
                  return FutureBuilder<List<PostDto>>(
                    future: imagesStore.posts,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PostDto>> snapshot) {
                      List<Widget> children = List.of([]);
                      children.add(const Divider(
                        color: Color(0xff3e3e3e),
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ));
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        snapshot.data!.reversed
                            .map((e) => {
                                  children.add(PostHeaderWidget(post: e)),
                                  if (e.postImages.length == 1)
                                    {
                                      children.add(Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(base64Decode(
                                                      e.postImages.first)),
                                                  fit: BoxFit.cover),
                                            ),
                                            height: 30,
                                          ),
                                        ),
                                      )),
                                    }
                                  else
                                    {
                                      children.add(
                                        CarouselSlider(
                                          items: getImages(e).map((i) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: i, fit: BoxFit.cover),
                                              ),
                                            );
                                          }).toList(),
                                          options: CarouselOptions(
                                              height:
                                                  MediaQuery.of(context).size.width,
                                              viewportFraction: 1.0,
                                              enableInfiniteScroll: false,
                                              onPageChanged: _updateImageIndex),
                                        ),
                                      )
                                    },
                                  children.add(PostBottomWidget(post: e)),
                                  children.add(PostLikesWidget(post: e)),
                                  children.add(const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      '3 декабря',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ))
                                })
                            .toList();
                      }
                      return Expanded(
                          child: ListView(
                        children: children,
                      ));
                    },
                  );
                }
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigatorWidget(),
    );
  }

  File getFile(AsyncSnapshot<List<User>> snapshot) {
    File file = File('avatar.png');
    file.writeAsBytes(base64Decode(snapshot.data!.first.image),
        mode: FileMode.write);
    return file;
  }

  List<ImageProvider> getImages(PostDto e) {
    List<ImageProvider> images = [];
    for (var image in e.postImages) {
      images.add(MemoryImage(base64Decode(image)));
    }
    return images;
  }
}
