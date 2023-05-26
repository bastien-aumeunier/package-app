import 'package:get/get_navigation/src/routes/get_route.dart';

import '../core/authentification/auth.middleware.dart';
import '../presentation/detail/binding/detail.binding.dart';
import '../presentation/detail/detail.dart';
import '../presentation/home/binding/home.binding.dart';
import '../presentation/home/home.dart';
import '../presentation/login/binding/login.binding.dart';
import '../presentation/login/login.dart';
import '../presentation/profile/binding/profile.binding.dart';
import '../presentation/profile/profil.dart';
import '../presentation/register/binding/register.binding.dart';
import '../presentation/register/register.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String profile = '/profile';
  static String login = '/login';
  static String register = '/register';
  static String details = '/details';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      middlewares: [AuthentificationMiddleware()],
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: details,
      page: () => const DetailScreen(),
      binding: DetailBinding(),
      middlewares: [AuthentificationMiddleware()],
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      middlewares: [AuthentificationMiddleware()],
    )
  ];
}
