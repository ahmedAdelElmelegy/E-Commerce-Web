import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/authentication/authentication_repository.dart';
import 'package:yt_ecommerce_admin_panel/firebase_options.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init local storage
  await GetStorage.init();
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((app) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
