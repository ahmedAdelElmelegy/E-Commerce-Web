import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/format_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

//  auth instance
  final _auth = FirebaseAuth.instance;

  // get auth user data
  User? get currentUser => _auth.currentUser;
  // is user logged in?
  bool get isAuthenticated => currentUser != null;
  @override
  void onReady() {
    // used for redirecting to login page if user is not authenticated
    _auth.setPersistence(Persistence.LOCAL);

    super.onReady();
  }

  // function to determine the relative screen and  redirect accordingly
  void screenRedirect() {
    if (!isAuthenticated) {
      Get.offAllNamed(TRoutes.login);
    } else {
      Get.offAllNamed(TRoutes.dashboard);
    }
  }

// login
  Future<UserCredential> loginWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw const TFormatException();
    } catch (e) {
      throw "Something went wrong . Please try later";
    }
  }

  // register
  Future<UserCredential> registerWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw const TFormatException();
    } catch (e) {
      throw "Something went wrong . Please try later";
    }
  }

// logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(TRoutes.login);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (_) {
      throw const TFormatException();
    } catch (_) {
      throw "Something went wrong . Please try later";
    }
  }

  // void screenRedirect() {
  //   if (!isAuthenticated) {
  //     Get.offAllNamed(TRoutes.login);
  //   } else {
  //     Get.offAllNamed(TRoutes.home);
  //   }
  // }
}
