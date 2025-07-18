
import 'package:dibasys_project/@core/responsive/device_type.dart';
import 'package:flutter/widgets.dart';

const _desktopBreakPoint = 950.0;
const _tabletBreakPoint = 600.0;

DeviceCategory getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;
  double deviceWidth = 0.0;
  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.width;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > _desktopBreakPoint) {
    return DeviceCategory.desktop;
  }
  if (deviceWidth > _tabletBreakPoint) {
    return DeviceCategory.tablet;
  }
  return DeviceCategory.mobile;
}

