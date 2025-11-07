import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/app.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes_middle_ware.dart';

class TAppRoute {
  static List<GetPage> pages = [
    GetPage(
      name: TRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: TRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: TRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: TRoutes.dashboard,
      page: () => const DashBoardScreen(),
      middlewares: [TRoutesMiddleWare()],
    ),
  ];
}
