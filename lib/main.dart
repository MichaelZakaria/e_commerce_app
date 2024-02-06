import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {

  /// widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// init --GetX local storage
  await GetStorage.init();

  // Todo: init payment methods

  /// await native splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// initialize firebase and authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  runApp(const App());
}

