import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/data/assets.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/custom_app_bar/app_bar_button.dart';

class CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
