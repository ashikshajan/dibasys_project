import 'package:dibasys_project/@core/controllers/loginController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/@core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.black,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        backgroundColor: AppThemes.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Welcome back to your account',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Phone number
            Text(
              'Phone number',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Consumer<LoginController>(
              builder: (context, provider, _) {
                return TextField(
                  controller: provider.phoneController,
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
                );
              },
            ),

            const SizedBox(height: 24),

            // Passcode
            Text(
              'Passcode',
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: Consumer<LoginController>(
                    builder: (context, provider, _) {
                      return TextField(
                        controller: provider.passcodeControllers[index],
                        focusNode: provider.passcodeFocusNodes[index],
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
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).requestFocus(
                              provider.passcodeFocusNodes[index + 1],
                            );
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).requestFocus(
                              provider.passcodeFocusNodes[index - 1],
                            );
                          }
                        },
                        onSubmitted: (value) {
                          if (index == 3) {
                            provider
                                .handleLogin(); // Optional: submit on last field
                          }
                        },
                      );
                    },
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),

            // Remember Me + Forgot Passcode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Consumer<LoginController>(
                      builder: (context, provider, _) {
                        return Checkbox(
                          activeColor: AppThemes.primary,
                          value: provider.rememberMe,
                          onChanged: (value) =>
                              provider.rememberMe = value ?? false,
                          side: const BorderSide(color: Colors.white),
                        );
                      },
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

            const SizedBox(height: 32),

            // Login Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Consumer<LoginController>(
                builder: (context, provider, _) {
                  return ElevatedButton(
                    onPressed: provider.handleLogin,
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
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Register Link
            Center(
              child: InkWell(
                onTap: () => context.go(RouteNames.registration),
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
            ),
          ],
        ),
      ),
    );
  }
}
