import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'package:flutter_netflix_responsive_ui/ui/views/navigation/navigation_view_model.dart';
import 'package:flutter_netflix_responsive_ui/ui/views/home/home_view.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/responsive/responsive.dart';

class NavigationView extends ViewModelBuilderWidget<NavigationViewModel> {
  @override
  bool get reactive => true;

  @override
  Widget builder(
    BuildContext context,
    NavigationViewModel model,
    Widget child,
  ) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        reverse: model.reverse,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            fillColor: Colors.black,
            transitionType: SharedAxisTransitionType.horizontal,
          );
        },
        child: getViewForIndex(model.currentIndex),
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.queue_play_next),
                  title: Text('Coming Soon'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download),
                  title: Text('Downloads'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  title: Text('More'),
                ),
              ],
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
            )
          : null,
    );
  }

  @override
  NavigationViewModel viewModelBuilder(BuildContext context) =>
      NavigationViewModel();

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView(key: PageStorageKey('homeView'));
      default:
        return Scaffold();
    }
  }
}
