import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/furniture_store_app.dart';
import 'package:furniture_shop_app/service_locator.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServiceLocator.initLocator();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 2754);
  //await FirebaseAuth.instance.setLanguageCode('ru');

  Bloc.observer = TalkerBlocObserver(
    settings: const TalkerBlocLoggerSettings(
      printChanges: true,
      printStateFullData: false,
    ),
  );

  runApp(FurnitureStoreApp());
}
