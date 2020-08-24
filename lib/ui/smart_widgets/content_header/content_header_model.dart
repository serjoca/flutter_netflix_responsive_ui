import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_netflix_responsive_ui/models/content.dart';

@singleton
class ContentHeaderModel extends BaseViewModel {
  VideoPlayerController _videoPlayerController;
  VideoPlayerController get videoPlayerController => _videoPlayerController;

  bool _isMuted = true;
  bool get isMuted => _isMuted;

  bool get isVideoInitialised => _videoPlayerController.value.initialized;

  void initialise(Content featuredContent) async {
    _videoPlayerController =
        VideoPlayerController.network(featuredContent.videoUrl);
    await _videoPlayerController.initialize();
    notifyListeners();

    Future.delayed(Duration(seconds: 2), () async {
      await _videoPlayerController.setVolume(0);
      await _videoPlayerController.play();
      notifyListeners();
    });
  }

  void onTap() {
    _videoPlayerController.value.isPlaying
        ? _videoPlayerController.pause()
        : _videoPlayerController.play();

    notifyListeners();
  }

  void toggleAudio() {
    _isMuted
        ? _videoPlayerController.setVolume(100)
        : _videoPlayerController.setVolume(0);
    _isMuted = _videoPlayerController.value.volume == 0;

    notifyListeners();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
