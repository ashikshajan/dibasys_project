import 'package:dibasys_project/@core/configs/core_theme.dart';
import 'package:dibasys_project/@core/controllers/appController.dart';
import 'package:dibasys_project/@core/controllers/checkin_controller.dart';
import 'package:dibasys_project/@core/controllers/dashboardController.dart';
import 'package:dibasys_project/@core/controllers/loginController.dart';
import 'package:dibasys_project/@core/controllers/reg_controller.dart';
import 'package:dibasys_project/@core/router/approuter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();
MaterialColor customSwatch = MaterialColor(0xffD2815E, <int, Color>{
  50: Color(0xfffceeea),
  100: Color(0xfff7d6cc),
  200: Color(0xfff1bbaa),
  300: Color(0xffec9f87),
  400: Color(0xffe78a6d),
  500: Color(0xffD2815E), // base
  600: Color(0xffb96d4d),
  700: Color(0xff9e5b3f),
  800: Color(0xff844931),
  900: Color(0xff693622),
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      kDebugMode ? [] : [DeviceOrientation.portraitUp],
    );
    return ScreenUtilSetup(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoginController(
              context: AppRouter
                  .router
                  .routerDelegate
                  .navigatorKey
                  .currentState!
                  .context,
            ),
          ),
          ChangeNotifierProvider(create: (context) => AppProvider()),
          ChangeNotifierProvider(create: (context) => DashBoardController()),
          ChangeNotifierProvider(create: (context) => CheckInController()),
          ChangeNotifierProvider(
            create: (context) => RegController(
              context: AppRouter
                  .router
                  .routerDelegate
                  .navigatorKey
                  .currentState!
                  .context,
            ),
          ),
        ],
        child: Consumer<AppProvider>(
          builder: (context, value, _) {
            return MaterialWidget(provider: value);
          },
        ),
      ),
    );
  }
}

class MaterialWidget extends StatefulWidget {
  final AppProvider provider;
  const MaterialWidget({super.key, required this.provider});

  @override
  State<MaterialWidget> createState() => _MaterialWidgetState();
}

class _MaterialWidgetState extends State<MaterialWidget> {
  void initAppTheme() {
    final appProviders = AppProvider.state(context);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaler: TextScaler.noScaling),
      child: MaterialApp.router(
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: widget.provider.themeMode,
        title: 'Dibasys',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: globalKey,

        routerConfig: AppRouter.router,
      ),
    );
  }
}

class ScreenUtilSetup extends StatelessWidget {
  final Widget child;

  const ScreenUtilSetup({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (number, screenUtil) {
        return number.toDouble();
      },
      builder: (context, child_) {
        return child;
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() {
    if (isEmpty) {
      return this;
    }
    return split(' ').map((word) => word.trim().capitalize()).join(' ');
  }
}
