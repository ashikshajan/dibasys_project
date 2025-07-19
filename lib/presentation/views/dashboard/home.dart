import 'package:dibasys_project/@core/controllers/checkin_controller.dart';
import 'package:dibasys_project/@core/controllers/dashboardController.dart';
import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE dd MMMM, yyyy').format(now);

    final userBox = Hive.box('userBox');
    final phone = userBox.get('loggedInUserPhone');
    final user = phone != null ? userBox.get(phone) : null;
    final name = user != null ? user['name'] ?? 'User' : 'User';

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF6E9E4), Color(0xFFE7D8D1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hey ${(name).toString().capitalize()}',
                            style: GoogleFonts.dmSans(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            formattedDate,
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20,
                        child: Image.asset("assets/images/profilepic.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Working Hours',
                          style: GoogleFonts.dmSans(color: Colors.white70),
                        ),
                        SizedBox(height: 8),
                        Consumer<CheckInController>(
                          builder: (context, provider, _) {
                            return Text(
                              '${provider.formatDuration(provider.elapsed)} Hrs',

                              style: GoogleFonts.dmSans(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Consumer<CheckInController>(
                    builder: (context, provider, _) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffD87C5A),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            provider.elapsed == Duration(seconds: 0)
                                ? context.go(RouteNames.checkInScreen)
                                : provider.stopTimer();
                          },
                          child: Text(
                            provider.elapsed == Duration(seconds: 0)
                                ? 'Manual Check-in'
                                : "Check-out",
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
