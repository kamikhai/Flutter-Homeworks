import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:home_works/hw4/database_helper.dart';
import 'package:home_works/hw4/dto/post_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';


part 'images_store.g.dart';

class ImagesStore = _ImagesStore with _$ImagesStore;

abstract class _ImagesStore with Store {

  @observable
  Future<List<PostDto>> posts = DatabaseHelper.instance.getPosts();

  @action
  Future<void> getFromGallery() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      List<String> images = List.empty(growable: true);
      for (var file in pickedFiles) {
        String img = base64.encode(Uint8List.view((await rootBundle.load(file.path)).buffer));
        images.add(img);
      }
      await DatabaseHelper.instance.addImage(images);
      posts = DatabaseHelper.instance.getPosts();
      log('end');
    }
  }
}
