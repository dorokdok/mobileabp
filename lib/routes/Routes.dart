import 'package:flutter/material.dart';
import 'AppRoutes.dart';
import '../view/container.dart';
import '../view/screen/item/update-screen.dart';
import '../view/screen/item/add-screen.dart';
import '../view/screen/item/detail-screen.dart';
import '../view/screen/item/storage-screen.dart';
import '../view/screen/item/storage-update-screen.dart';
import '../view/screen/auth/login-screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routes) {
    switch (routes.name) {
      case AppRouters.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case AppRouters.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeContainer());
      case AppRouters.addItem:
        return MaterialPageRoute(
            builder: (BuildContext context) => ItemAddScreen());
      case AppRouters.itemDetail:
        final id = routes.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => ItemDetailScreen(id: id));
      case AppRouters.editItem:
        return MaterialPageRoute(
            builder: (BuildContext context) => ItemUpdateScreen());
      case AppRouters.itemStorages:
        return MaterialPageRoute(
            builder: (BuildContext context) => ItemStorageScreen());
      case AppRouters.editItemStorage:
        final index = routes.arguments as int;
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ItemStorageUpdateScreen(index: index));
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
