import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw1/homework_1_page.dart';
import 'package:home_works/hw2/homework_2_page.dart';
import 'package:home_works/hw3/homework_3_module.dart';
import 'package:home_works/hw4/homework_4_module.dart';
import 'package:home_works/module/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MyHomePage(title: 'Homeworks')),
        ChildRoute('/hw1',
            child: (context, args) => HomeWork1Page(title: 'HW1. Widgets')),
        ChildRoute('/hw2',
            child: (context, args) => HomeWork2Page(title: 'HW2. API, MobX')),
        ModuleRoute('/hw3/', module: HomeWork3Module()),
        ModuleRoute('/hw4/', module: HomeWork4Module()),
      ];
}
