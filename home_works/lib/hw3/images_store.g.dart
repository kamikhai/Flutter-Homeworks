// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImagesStore on _ImagesStore, Store {
  final _$imagesAtom = Atom(name: '_ImagesStore.images');

  @override
  ObservableList<GalleryImage> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<GalleryImage> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$_ImagesStoreActionController = ActionController(name: '_ImagesStore');

  @override
  void addImage(GalleryImage image) {
    final _$actionInfo = _$_ImagesStoreActionController.startAction(
        name: '_ImagesStore.addImage');
    try {
      return super.addImage(image);
    } finally {
      _$_ImagesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images}
    ''';
  }
}
