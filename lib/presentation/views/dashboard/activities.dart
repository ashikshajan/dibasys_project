import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Activities page",
          style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
