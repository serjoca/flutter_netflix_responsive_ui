import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/ui/widgets/custom_app_bar/custom_app_bar_mobile.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/custom_app_bar/custom_app_bar_desktop.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/responsive/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  CustomAppBar({
    this.scrollOffset = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color: Colors.black.withOpacity(
        (scrollOffset / 350.0).clamp(0, 1).toDouble(),
      ),
      child: Responsive(
        mobile: CustomAppBarMobile(),
        desktop: CustomAppBarDesktop(),
      ),
    );
  }
}
