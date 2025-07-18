import 'package:dibasys_project/@core/responsive/sizing_information.dart';
import 'package:dibasys_project/@core/responsive/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  )
  builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        SizingInformation sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            boxConstraints.maxWidth,
            boxConstraints.maxHeight,
          ),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
