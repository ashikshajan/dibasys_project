import 'package:dibasys_project/@core/controllers/dashboardController.dart';
import 'package:dibasys_project/@core/theme/app_theme.dart';
import 'package:dibasys_project/@core/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardController>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: provider.bottomNavIndex.index == 0
                ? null
                : Text(
                    provider.bottomNavIndex.name,
                    style: GoogleFonts.dmSans(color: Colors.black),
                  ),
            backgroundColor: Color.fromARGB(255, 251, 233, 224),
            leading: Builder(
              builder: (context) {
                return Container(
                  width: 40, // Add this
                  height: 40,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: SvgPicture.asset("assets/images/icons/drawer.svg"),
                  ),
                );
              },
            ),

            actions: [
              provider.bottomNavIndex.index == 0
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: SvgPicture.asset(
                        "assets/images/icons/download.svg",
                        height: 18,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          extendBodyBehindAppBar: false,
          drawer: AppDrawer(),
          body: provider.viewBody(provider.bottomNavIndex.index),

          bottomNavigationBar: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white10),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(provider.tabs.length, (index) {
                  final isSelected = index == provider.bottomNavIndex.index;

                  return InkWell(
                    onTap: () {
                      provider.setBottomNavIndex = BottomNavClass(
                        index: index,
                        name: provider.tabs[index]['label'],
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/${provider.tabs[index]["icon"]}.svg",
                          height: 26,
                          color: isSelected ? AppThemes.primary : Colors.white,
                        ),

                        const SizedBox(height: 4),
                        Text(
                          provider.tabs[index]['label'],
                          style: GoogleFonts.inter(
                            color: isSelected
                                ? AppThemes.primary
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
