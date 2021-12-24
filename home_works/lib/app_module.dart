import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/hw2/message_store.dart';
import 'package:home_works/hw2/theme_store.dart';
import 'package:home_works/module/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ThemeStore()),
    Bind.singleton((i) => MessageStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule())
  ];
}