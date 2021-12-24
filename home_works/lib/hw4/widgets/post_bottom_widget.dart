import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw4/dto/post_dto.dart';

import '../store/carousel_store.dart';
import '../instagram_icons_icons.dart';

class PostBottomWidget extends StatefulWidget {
  const PostBottomWidget({Key? key, required this.post}) : super(key: key);

  final PostDto post;

  @override
  State<StatefulWidget> createState() => _PostBottomWidgetState();
}

class _PostBottomWidgetState extends State<PostBottomWidget> {
  CarouselStore carouselStore = Modular.get<CarouselStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              InstagramIcons.like,
              color: Colors.white,
              size: 28,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              InstagramIcons.comment,
              color: Colors.white,
              size: 28,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              InstagramIcons.send,
              color: Colors.white,
              size: 26,
            ),
          ),
          Expanded(
            child: Align(
              child: SizedBox(child: getDots(widget.post), width: 50),
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            width: 132,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                child: Icon(
                  InstagramIcons.save,
                  color: Colors.white,
                  size: 28,
                ),
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
  getDots(PostDto e) {
    if (e.postImages.length > 1)
    {
      return Row(
        children: List.generate(e.postImages.length,
                (index) => index).map((element) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Observer(builder: (context) {
              return Container(
                height: 7.0,
                width: 7.0,
                decoration: BoxDecoration(
                  color: element ==
                      carouselStore
                          .chosenImageIndex
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius:
                  BorderRadius.circular(4.0),
                ),
              );
            }),
          );
        }).toList(),
      );
    } else {
      return Row();
    }
  }
}
