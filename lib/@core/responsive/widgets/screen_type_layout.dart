import 'package:dibasys_project/@core/responsive/device_type.dart';
import 'package:dibasys_project/@core/responsive/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceType == DeviceCategory.desktop) {
          if (desktop != null) {
            return desktop!;
          }
        } else if (sizingInformation.deviceType == DeviceCategory.tablet) {
          if (tablet != null) {
            return tablet!;
          }
        }

        return mobile;
      },
    );
  }
}
