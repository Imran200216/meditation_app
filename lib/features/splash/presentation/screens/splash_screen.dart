import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/commons/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      // Intro Screen
      GoRouter.of(context).pushReplacementNamed(AppRouterConstants.intro);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: KText(text: 'Splash', fontSize: 20)),
      ),
    );
  }
}
