import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/models/content.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/responsive/responsive.dart';
import 'package:flutter_netflix_responsive_ui/ui/smart_widgets/content_header/content_header_desktop.dart';
import 'package:flutter_netflix_responsive_ui/ui/smart_widgets/content_header/content_header_mobile.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  ContentHeader({
    @required this.featuredContent,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ContentHeaderMobile(featuredContent: featuredContent),
      desktop: ContentHeaderDesktop(featuredContent: featuredContent),
    );
  }
}
