import 'dart:async';

import 'package:clean_architecture/domain/models/models.dart';
import 'package:clean_architecture/presentation/base/baseViewModel.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';

import '../../resources/strings_manager.dart';

class OnBordingViewModel extends BaseViewModel
    with OnBordingViewModelInputs, OnBordingViewModelOuputs {
  // stream conroller output
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    _postDataView();
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;

    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataView();
  }

  @override
  int goNext() {
    int previousIndex = ++_currentIndex;
    print(_currentIndex);
    if (previousIndex == _list.length) {
      // _currentIndex = 0;
      previousIndex = 0;
    }
    return previousIndex;
  }

  @override
  Sink get inputSliderViewObjects => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((SliderViewObject) => SliderViewObject);

  // Onboarding private function

  void _postDataView() {
    inputSliderViewObjects.add(SliderViewObject(
        sliderObject: _list[_currentIndex],
        numberSliders: _list.length,
        currntIndex: _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppString.onBordingTatile1, AppString.onBordingSubTatile1,
            ImageAssets.onboardingLogo1),
        SliderObject(AppString.onBordingTatile2, AppString.onBordingSubTatile2,
            ImageAssets.onboardingLogo2),
        SliderObject(AppString.onBordingTatile3, AppString.onBordingSubTatile3,
            ImageAssets.onboardingLogo3),
        SliderObject(AppString.onBordingTatile4, AppString.onBordingSubTatile4,
            ImageAssets.onboardingLogo4),
      ];
}

// inputs mean that "Orders" that our view model will receive view
abstract class OnBordingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe leftr
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);
  // stream controller input
  Sink get inputSliderViewObjects;
}

abstract class OnBordingViewModelOuputs {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
