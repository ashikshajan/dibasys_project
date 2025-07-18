import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/@core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.push(RouteNames.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dbs.png',
            color: const Color(0xfff8360e).withOpacity(0.7),
            height: 250,
          ),
          const Center(
            child: CircularProgressIndicator(color: Color(0xfff8360e)),
          ),
        ],
      ),
    );
  }
}
