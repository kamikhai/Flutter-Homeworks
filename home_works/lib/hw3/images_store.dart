import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';
import 'image.dart';

part 'images_store.g.dart';

class ImagesStore = _ImagesStore with _$ImagesStore;

abstract class _ImagesStore with Store {
  @observable
  ObservableList<GalleryImage> images = ObservableList.of([
    GalleryImage(name: 'img1.jpeg', url: 'assets/images/img1.jpeg'),
    GalleryImage(name: 'img2.jpeg', url: 'assets/images/img2.jpeg'),
    GalleryImage(name: 'img3.jpeg', url: 'assets/images/img3.jpeg'),
    GalleryImage(name: 'img4.jpeg', url: 'assets/images/img4.jpeg'),
    GalleryImage(name: 'img5.jpeg', url: 'assets/images/img5.jpeg'),
    GalleryImage(name: 'img6.jpeg', url: 'assets/images/img6.jpeg'),
    GalleryImage(name: 'img7.jpeg', url: 'assets/images/img7.jpeg'),
    GalleryImage(name: 'img8.jpeg', url: 'assets/images/img8.jpeg'),
    GalleryImage(name: 'img9.jpeg', url: 'assets/images/img9.jpeg'),
    GalleryImage(name: 'img10.jpeg', url: 'assets/images/img10.jpeg'),
    GalleryImage(name: 'img11.jpeg', url: 'assets/images/img11.jpeg'),
  ]);

  void getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      addImage(
          GalleryImage(name: basename(pickedFile.path), url: pickedFile.path));
    }
  }

  void getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      addImage(
          GalleryImage(name: basename(pickedFile.path), url: pickedFile.path));
    }
  }

  @action
  void addImage(GalleryImage image) {
    images.add(image);
    images = ObservableList.of(images);
  }
}
