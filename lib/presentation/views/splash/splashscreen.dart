import 'package:dibasys_project/@core/configs/shared_pref.dart';
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
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    var loginValue = await SharedPrefsUtil.getString(SharedPrefsUtil.loggedin);

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (loginValue == "loggedin") {
          context.push(RouteNames.dashboard);
        } else {
          context.pushReplacement(RouteNames.login);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.black,
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
