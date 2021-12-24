// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarouselStore on _CarouselStore, Store {
  final _$chosenImageIndexAtom = Atom(name: '_CarouselStore.chosenImageIndex');

  @override
  int get chosenImageIndex {
    _$chosenImageIndexAtom.reportRead();
    return super.chosenImageIndex;
  }

  @override
  set chosenImageIndex(int value) {
    _$chosenImageIndexAtom.reportWrite(value, super.chosenImageIndex, () {
      super.chosenImageIndex = value;
    });
  }

  final _$_CarouselStoreActionController =
      ActionController(name: '_CarouselStore');

  @override
  void updateIndex(int index) {
    final _$actionInfo = _$_CarouselStoreActionController.startAction(
        name: '_CarouselStore.updateIndex');
    try {
      return super.updateIndex(index);
    } finally {
      _$_CarouselStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chosenImageIndex: ${chosenImageIndex}
    ''';
  }
}
