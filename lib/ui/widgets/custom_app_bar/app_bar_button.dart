import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  AppBarButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
