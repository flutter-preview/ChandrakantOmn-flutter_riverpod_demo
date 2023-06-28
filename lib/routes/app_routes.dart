import 'package:flutter_riverpod_demo/features/home/view/home_page.dart';
import 'package:flutter_riverpod_demo/features/user/view/user_page.dart';
import 'package:flutter_riverpod_demo/routes/routes.dart';

class AppRoutes {
  static final routes = {
    Routes.home: (context) => const HomePage(),
    Routes.user: (context) =>  UserPage(),
  };
}
