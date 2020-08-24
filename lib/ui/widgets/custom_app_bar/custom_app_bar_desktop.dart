import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/data/assets.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/custom_app_bar/app_bar_button.dart';

class CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  title: 'Home',
                  onTap: () => print('Home'),
                ),
                AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                AppBarButton(
                  title: 'Latest',
                  onTap: () => print('Latest'),
                ),
                AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.search),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Search'),
                ),
                AppBarButton(
                  title: 'KIDS',
                  onTap: () => print('KIDS'),
                ),
                AppBarButton(
                  title: 'DVD',
                  onTap: () => print('DVD'),
                ),
                AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Gift'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
