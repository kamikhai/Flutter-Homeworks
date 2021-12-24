import 'package:mobx/mobx.dart';

part 'carousel_store.g.dart';

class CarouselStore = _CarouselStore with _$CarouselStore;

abstract class _CarouselStore with Store {
  @observable
  int chosenImageIndex = 0;

  @action
  void updateIndex(int index) {
    chosenImageIndex = index;
  }
}
