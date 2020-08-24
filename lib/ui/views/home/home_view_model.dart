import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

@singleton
class HomeViewModel extends BaseViewModel implements Initialisable {
  ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  double _scrollOffset = 0.0;
  double get scrollOffset => _scrollOffset;

  @override
  void initialise() {
    _scrollController = ScrollController();
    _scrollController.addListener(this.onScrollChange);
  }

  void onScrollChange() {
    _scrollOffset = _scrollController.offset;
    notifyListeners();
  }
}
