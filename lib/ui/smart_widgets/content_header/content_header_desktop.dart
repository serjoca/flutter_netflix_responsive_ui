import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/models/content.dart';
import 'package:flutter_netflix_responsive_ui/app/locator.dart';
import 'package:flutter_netflix_responsive_ui/ui/smart_widgets/content_header/content_header_model.dart';
import 'package:flutter_netflix_responsive_ui/ui/widgets/play_button/play_button.dart';
import 'package:video_player/video_player.dart';

class ContentHeaderDesktop extends ViewModelBuilderWidget<ContentHeaderModel> {
  final Content featuredContent;

  ContentHeaderDesktop({
    @required this.featuredContent,
  });

  @override
  bool get reactive => true;

  @override
  bool get fireOnModelReadyOnce => true;

  @override
  void onViewModelReady(model) {
    model.initialise(featuredContent);
  }

  @override
  Widget builder(
    BuildContext context,
    ContentHeaderModel model,
    Widget child,
  ) {
    return GestureDetector(
      onTap: model.onTap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: model.isVideoInitialised
                ? model.videoPlayerController.value.aspectRatio
                : 2.344,
            child: model.isVideoInitialised
                ? VideoPlayer(model.videoPlayerController)
                : Image.asset(
                    featuredContent.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: model.isVideoInitialised
                  ? model.videoPlayerController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(featuredContent.titleImageUrl),
                ),
                const SizedBox(height: 15.0),
                Text(
                  featuredContent.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    PlayButton(),
                    const SizedBox(width: 16.0),
                    FlatButton.icon(
                      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 1.0),
                      onPressed: () => print('More Info'),
                      color: Colors.white,
                      icon: const Icon(Icons.info_outline, size: 30.0),
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    if (model.isVideoInitialised)
                      IconButton(
                        icon: Icon(
                          model.isMuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: model.toggleAudio,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ContentHeaderModel viewModelBuilder(BuildContext context) =>
      locator<ContentHeaderModel>();
}
