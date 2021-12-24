import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw4/store/images_store.dart';
import 'package:home_works/hw4/store/carousel_store.dart';

import 'homework_4_page.dart';

class HomeWork4Module extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => CarouselStore()),
    Bind.singleton((i) => ImagesStore()),

  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                const HomeWork4Page()),
      ];
}
