import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw3/detail_info.dart';
import 'package:home_works/hw3/grid_store.dart';
import 'package:home_works/hw3/homework_3_page.dart';
import 'package:home_works/hw3/images_store.dart';

class HomeWork3Module extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GridStore()),
        Bind.singleton((i) => ImagesStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                HomeWork3Page(title: 'HW3. Gallery, Animation')),
        ChildRoute('/detail',
            child: (context, args) => DetailInfoPage(image: args.data),
            transition: TransitionType.fadeIn),
      ];
}
