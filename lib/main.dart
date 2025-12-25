import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_app/core/router/app_router.dart';
import 'package:meditation_app/core/service/audio_service.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/di/service_locator.dart';
import 'package:meditation_app/providers/app_bloc_providers.dart';

// Make audioHandler globally accessible
late AudioPlayerHandler audioHandler;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Service Locator
  serviceLocator();

  // Initialize AudioService and store the handler globally
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.meditation.app',
      androidNotificationChannelName: 'Meditation Audio',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appBlocProvider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Meditation App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}