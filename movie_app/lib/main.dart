import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/application/bindings/application_bindings.dart';
import 'package:movie_app/application/ui/movie_app_ui_config.dart';
import 'package:movie_app/modules/home/home_module.dart';
import 'package:movie_app/modules/login/login_module.dart';
import 'package:movie_app/modules/movie_detail/movie_detail_module.dart';
import 'package:movie_app/modules/splash/splash_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MovieAppUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: MovieAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
