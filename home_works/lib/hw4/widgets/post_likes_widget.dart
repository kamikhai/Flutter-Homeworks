import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_works/hw4/dto/post_dto.dart';

class PostLikesWidget extends StatefulWidget {
  const PostLikesWidget({Key? key, required this.post}) : super(key: key);

  final PostDto post;

  @override
  State<StatefulWidget> createState() => _PostLikesWidgetState();
}

class _PostLikesWidgetState extends State<PostLikesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    left: 30,
                    child: SizedBox(
                      width: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(width: 1.2, color: Colors.black),
                          image: DecorationImage(
                              image: MemoryImage(base64Decode(
                                  widget.post.likes.elementAt(2).image)),
                              fit: BoxFit.cover),
                        ),
                        height: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    child: SizedBox(
                      width: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(width: 1.2, color: Colors.black),
                          image: DecorationImage(
                              image: MemoryImage(base64Decode(widget
                                  .post.likes.reversed
                                  .elementAt(1)
                                  .image)),
                              fit: BoxFit.cover),
                        ),
                        height: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    child: SizedBox(
                      width: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(width: 1.2, color: Colors.black),
                          image: DecorationImage(
                              image: MemoryImage(base64Decode(widget
                                  .post.likes.reversed
                                  .elementAt(0)
                                  .image)),
                              fit: BoxFit.cover),
                        ),
                        height: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(fontSize: 13),
                  children: [
                    const TextSpan(text: 'Нравится '),
                    TextSpan(
                        text:
                            widget.post.likes.reversed.elementAt(0).name + ' ',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: 'и '),
                    TextSpan(
                        text:
                            'ещё ' + (widget.post.likes.length - 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
