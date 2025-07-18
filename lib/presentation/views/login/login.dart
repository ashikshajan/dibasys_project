import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/@core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        backgroundColor: AppThemes.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Login',
                style: GoogleFonts.dmSans(
                  color: AppThemes.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Welcome back to your account',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 32),

            // Phone Number
            Text(
              'Phone number',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.phone,
              maxLength: 10,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: GoogleFonts.dmSans(color: Colors.white),
            ),

            SizedBox(height: 24),

            // Passcode
            Text(
              'Passcode',
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 16),

            // Remember Me + Forgot Passcode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppThemes.primary,
                      value: rememberMe,
                      onChanged: (value) =>
                          setState(() => rememberMe = value ?? false),
                      side: BorderSide(color: Colors.white),
                    ),
                    Text(
                      "Remember me",
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Passcode?",
                    style: GoogleFonts.dmSans(
                      color: AppThemes.primary,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: AppThemes.primary,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.go(RouteNames.dashboard);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemes.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.dmSans(
                    color: AppThemes.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            // Register Link
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have account? ",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: GoogleFonts.dmSans(
                        color: AppThemes.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
