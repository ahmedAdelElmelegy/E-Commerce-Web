import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/authentication/authentication_repository.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/user/user_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controller/user_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/model/user_model.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = false.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('Remember_Me_Email') ?? '';
    password.text = localStorage.read('Remember_Me_Password') ?? '';

    super.onInit();
  }

  // email and  password signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // loading
      TFullScreenLoader.openLoadingDialog(
          'Register Admin Account.....', TImages.docerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }
      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // save remember me data
      if (rememberMe.value) {
        localStorage.write('Remember_Me_Email', email.text.trim());
        localStorage.write('Remember_Me_Password', password.text.trim());
      }
      // register admin
      await AuthenticationRepository.instance
          .loginWithEmailPassword(email.text.trim(), password.text.trim());

      await UserController.instance.fetchUserDetails();

      // stop loading
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  // register
  Future<void> registerAdmin() async {
    try {
      // loading
      TFullScreenLoader.openLoadingDialog(
          'Register Admin Account.....', TImages.docerAnimation);
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }
      // register admin
      await AuthenticationRepository.instance
          .registerWithEmailPassword('ahmed@gmail.com', 'ahmed@123456');
      final userRepository = Get.put(UserRepository());
      userRepository.saveUser(UserModel(
        id: AuthenticationRepository.instance.currentUser!.uid,
        firstName: 'Ahmed',
        lastName: 'Adel',
        role: AppRole.admin,
        createdAt: DateTime.now(),
        email: 'ahmed@gmail.com',
      ));
      // stop loading
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
      // navigate to home
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }
}
