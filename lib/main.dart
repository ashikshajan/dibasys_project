import 'package:dibasys_project/@core/configs/core_theme.dart';
import 'package:dibasys_project/@core/controllers/appController.dart';
import 'package:dibasys_project/@core/controllers/loginController.dart';
import 'package:dibasys_project/@core/router/approuter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MaterialColor customColor = MaterialColor(
    const Color.fromRGBO(17, 25, 64, 1).value,
    const <int, Color>{
      50: Color.fromRGBO(17, 25, 64, 0.1),
      100: Color.fromRGBO(17, 25, 64, 0.2),
      200: Color.fromRGBO(17, 25, 64, 0.3),
      300: Color.fromRGBO(17, 25, 64, 0.4),
      400: Color.fromRGBO(17, 25, 64, 0.5),
      500: Color.fromRGBO(17, 25, 64, 0.6),
      600: Color.fromRGBO(17, 25, 64, 0.7),
      700: Color.fromRGBO(17, 25, 64, 0.8),
      800: Color.fromRGBO(17, 25, 64, 0.9),
      900: Color.fromRGBO(17, 25, 64, 1),
    },
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      kDebugMode ? [] : [DeviceOrientation.portraitUp],
    );
    return ScreenUtilSetup(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginController()),
          ChangeNotifierProvider(create: (context) => AppProvider()),
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
