import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/authentication/authentication_repository.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/user/user_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/model/user_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final UserRepository userRepository = UserRepository.instance;
  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    final currentUser = AuthenticationRepository.instance.currentUser;
    if (currentUser != null) {
      fetchUserDetails();
    } else {
      debugPrint("⚠️ لم يتم تسجيل الدخول بعد، سيتم تجاهل fetchUserDetails");
    }
    super.onInit();
  }

  Future<UserModel?> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      debugPrint("full name is :${user!.email}");

      this.user.value = user!;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(
          title: 'some thing went wrong', message: e.toString());
      return UserModel.empty();
    }
  }
}
