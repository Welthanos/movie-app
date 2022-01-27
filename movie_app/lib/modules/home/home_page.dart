import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/application/ui/movie_app_icon_icons.dart';
import 'package:movie_app/application/ui/theme_extensions.dart';
import 'package:movie_app/modules/favorites/favorites_bindings.dart';
import 'package:movie_app/modules/favorites/favorites_page.dart';
import 'package:movie_app/modules/home/home_controller.dart';
import 'package:movie_app/modules/movies/movies_bindings.dart';
import 'package:movie_app/modules/movies/movies_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(MovieAppIcon.heart_empty), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.login_outlined), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => MoviesPage(),
              binding: MoviesBindings(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => FavoritesPage(),
              binding: FavoritesBindings(),
            );
          }

          return null;
        },
      ),
    );
  }
}
