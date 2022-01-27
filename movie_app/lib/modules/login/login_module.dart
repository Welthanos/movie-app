import 'package:get/get.dart';
import 'package:movie_app/application/modules/module.dart';
import 'package:movie_app/modules/login/login_bindings.dart';
import 'package:movie_app/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBindings()
    )
  ];
}
