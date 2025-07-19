import 'package:dibasys_project/@core/controllers/checkin_controller.dart';
import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/@core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CheckInController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () => context.go(RouteNames.dashboard),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Check-in",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Select Check-in Type",
              style: GoogleFonts.dmSans(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/images/icons/worker.svg"),
                        SizedBox(height: 8),
                        Text(
                          'Worker',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Project Dropdown
                  DropdownButtonFormField<String>(
                    value: controller.selectedProject,
                    dropdownColor: Colors.grey[900],
                    decoration: _inputDecoration('Projects'),
                    style: GoogleFonts.dmSans(color: Colors.white),
                    items: ['Project A', 'Project B', 'Project C']
                        .map(
                          (project) => DropdownMenuItem(
                            value: project,
                            child: Text(
                              project,
                              style: GoogleFonts.dmSans(
                                color: Colors.white70,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: controller.setProject,
                  ),

                  SizedBox(height: 16),

                  // Gate Dropdown
                  DropdownButtonFormField<String>(
                    value: controller.selectedGate,
                    dropdownColor: Colors.grey[900],
                    decoration: _inputDecoration('Gates'),
                    style: GoogleFonts.dmSans(color: Colors.white),
                    items: ['Gate 1', 'Gate 2', 'Gate 3']
                        .map(
                          (gate) => DropdownMenuItem(
                            value: gate,
                            child: Text(
                              gate,
                              style: GoogleFonts.dmSans(
                                color: Colors.white70,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: controller.setGate,
                  ),

                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Work Type",
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Radio<String>(
                        value: 'Budget',
                        groupValue: controller.workType,
                        onChanged: controller.setWorkType,
                        activeColor: AppThemes.primary,
                      ),
                      Text(
                        'Budget',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 20),
                      Radio<String>(
                        value: 'Issue',
                        groupValue: controller.workType,
                        onChanged: controller.setWorkType,
                        activeColor: AppThemes.primary,
                      ),
                      Text(
                        'Issue',
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Check-in Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDF8765),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (controller.validateCheckIn(context)) {
                          controller.startTimer();
                          context.go(RouteNames.dashboard);
                        }
                      },
                      child: Text(
                        'Check-in',
                        style: GoogleFonts.dmSans(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.black,
      hintText: hint,
      hintStyle: GoogleFonts.dmSans(
        color: Colors.white70,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white24),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(),
    );
  }
}
