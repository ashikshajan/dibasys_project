import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Jobs page",
          style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
