import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/furniture_store_app.dart';
import 'package:furniture_shop_app/service_locator.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.initLocator();

  Bloc.observer = TalkerBlocObserver(
    settings: const TalkerBlocLoggerSettings(
      printChanges: true,
      printStateFullData: false,
    ),
  );

  runApp(FurnitureStoreApp());
}
