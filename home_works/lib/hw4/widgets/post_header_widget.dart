import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw4/dto/post_dto.dart';

import '../store/carousel_store.dart';
import '../instagram_icons_icons.dart';

class PostHeaderWidget extends StatefulWidget {
  const PostHeaderWidget({Key? key, required this.post}) : super(key: key);

  final PostDto post;

  @override
  State<StatefulWidget> createState() => _PostHeaderWidgetState();
}

class _PostHeaderWidgetState extends State<PostHeaderWidget> {
  CarouselStore carouselStore = Modular.get<CarouselStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 30.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(90),
                  image: DecorationImage(
                      image: MemoryImage(
                          base64Decode(widget.post.user.image)),
                      fit: BoxFit.cover),
                ),
                height: 30,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 9.0),
                  child: Text(
                    widget.post.user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget.post.post.location,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
            child: Icon(
              InstagramIcons.menu,
              color: Colors.white,
              size: 15,
            ),
          )
        ],
      ),
    );
  }

}
