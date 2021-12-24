// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImagesStore on _ImagesStore, Store {
  final _$postsAtom = Atom(name: '_ImagesStore.posts');

  @override
  Future<List<PostDto>> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(Future<List<PostDto>> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$getFromGalleryAsyncAction =
      AsyncAction('_ImagesStore.getFromGallery');

  @override
  Future<void> getFromGallery() {
    return _$getFromGalleryAsyncAction.run(() => super.getFromGallery());
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
