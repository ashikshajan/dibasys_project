import 'package:dibasys_project/@core/configs/shared_pref.dart';
import 'package:dibasys_project/@core/controllers/appController.dart';
import 'package:dibasys_project/@core/controllers/dashboardController.dart';
import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/@core/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final appProvider = Provider.of<AppProvider>(context);
    // final scrollProvider = Provider.of<ScrollProvider>(context);

    return Drawer(
      child: Consumer2<DashBoardController, AppProvider>(
        builder: (context, provider, appProvider, _) {
          return Material(
            color: !appProvider.isDark ? Colors.black : Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      "Dark Mode",
                      style: GoogleFonts.inter(
                        color: AppThemes.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Switch(
                      inactiveTrackColor: Colors.black,
                      value: !appProvider.isDark,
                      onChanged: (value) {
                        appProvider.setTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                      activeColor: !appProvider.isDark
                          ? AppThemes.primary
                          : Colors.white,
                    ),
                  ),

                  ...List.generate(provider.tabs.length, (index) {
                    final isSelected = index == provider.bottomNavIndex.index;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          provider.setBottomNavIndex = BottomNavClass(
                            index: index,
                            name: provider.tabs[index]['label'],
                          );
                          Scaffold.of(context).closeDrawer();
                        },
                        child: ListTile(
                          tileColor: Colors.transparent,
                          leading: SvgPicture.asset(
                            "assets/images/icons/${provider.tabs[index]["icon"]}.svg",
                            height: 26,
                            color: isSelected
                                ? AppThemes.primary
                                : !appProvider.isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                          title: Text(
                            provider.tabs[index]['label'],
                            style: GoogleFonts.dmSans(
                              color: isSelected
                                  ? AppThemes.primary
                                  : !appProvider.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        provider.setBottomNavIndex = BottomNavClass(
                          name: "Home",
                          index: 0,
                        );
                        Scaffold.of(context).closeDrawer();
                        context.pushReplacement(RouteNames.login);
                        SharedPrefsUtil.logOut();
                      },
                      child: ListTile(
                        tileColor: Colors.transparent,
                        leading: SvgPicture.asset(
                          "assets/images/icons/logout.svg",

                          height: 26,
                          color: !appProvider.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                        title: Text(
                          "Logout",
                          style: GoogleFonts.dmSans(
                            color: !appProvider.isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
