import 'package:flutter/material.dart';

class DirectionPattern extends StatelessWidget {
  final Widget horizontalWidget;
  final Widget verticalWidget;

  const DirectionPattern({
    Key? key,
    required this.horizontalWidget,
    required this.verticalWidget,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isHorizontal(BuildContext context) =>
      MediaQuery.of(context).size.width >=1100;

  static bool isVertical(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 ;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a horizontal screen
    if (_size.width >= 1100) {
      return horizontalWidget;
    } else {
      return verticalWidget;
    }
  }
}
