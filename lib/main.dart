import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_app/core/router/app_router.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/di/service_locator.dart';
import 'package:meditation_app/providers/app_bloc_providers.dart';

void main() {
  // Service Locator
  serviceLocator();

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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: AppColors.primaryColor),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
