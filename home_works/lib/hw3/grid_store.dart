import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'grid_store.g.dart';

class GridStore = _GridStore with _$GridStore;

abstract class _GridStore with Store {
  @observable
  Icon gridIcon = const Icon(Icons.view_stream);

  @observable
  int gridSize = 3;

  bool isBig = false;

  @action
  changeGridSize() {
    if (isBig) {
      gridSize = 3;
    } else {
      gridSize = 1;
    }
  }

  @action
  changeIcon() {
    if (isBig) {
      gridIcon = const Icon(Icons.view_stream);
      isBig = false;
    } else {
      gridIcon = const Icon(Icons.view_module);
      isBig = true;
    }
  }
}
