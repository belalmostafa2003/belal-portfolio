import 'package:flutter/widgets.dart';

class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
}


class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({super.key, required this.mobile, required this.tablet, required this.desktop});

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width <= Breakpoints.mobile;
  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w > Breakpoints.mobile && w <= Breakpoints.tablet;
  }

  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width > Breakpoints.tablet;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w <= Breakpoints.mobile) return mobile;
    if (w <= Breakpoints.tablet) return tablet;
    return desktop;
  }
}