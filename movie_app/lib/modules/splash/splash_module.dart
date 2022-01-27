import 'package:get/get.dart';
import 'package:movie_app/application/modules/module.dart';
import 'package:movie_app/modules/splash/splash_bindings.dart';
import 'package:movie_app/modules/splash/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashBindings(),
    )
  ];
}
