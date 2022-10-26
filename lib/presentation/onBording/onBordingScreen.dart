// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/styles_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _Index = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: ColorManager.white,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        // itemCount: _Index, // hada rah yedirli problam
        onPageChanged: (value) {
          _Index = value;
        },
        itemBuilder: (context, index) {
          return OnBordingPage(_list[_Index]);
        },
      ),

      // bottomSheet
      bottomSheet: Container(
        color: ColorManager.white,
        // height: AppSize.s100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesManager.loginRoute);
                },
                child: Text(
                  AppString.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left  arrow
          Padding(
            padding: EdgeInsets.all(AppSize.s14),
            child: GestureDetector(
              child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.left_arrow_ic)),
              onTap: () {
                _pageController.animateToPage(_getPreviousIndex(),
                    duration:
                        Duration(microseconds: AppConstants.sliderInimait),
                    curve: Curves.bounceInOut);
                setState(() {});
              },
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: EdgeInsets.all(AppPading.p8),
                  child: _getProperCircle(i),
                ),
            ],
          ),
          // right arrow
          Padding(
            padding: EdgeInsets.all(AppSize.s14),
            child: GestureDetector(
              child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.right_arrow_ic)),
              onTap: () {
                _pageController.animateToPage(_getNextIndex(),
                    duration:
                        Duration(microseconds: AppConstants.sliderInimait),
                    curve: Curves.bounceInOut);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = --_Index;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int previousIndex = ++_Index;
    if (previousIndex == _list.length) {
      previousIndex = 0;
    }
    return previousIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _Index) {
      return SvgPicture.asset(ImageAssets.hollow_circle_ic);
    } else {
      return SvgPicture.asset(ImageAssets.solid_circle_ic);
    }
  }
}

class OnBordingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  OnBordingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPading.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPading.p8),
          child: Text(
            _sliderObject.subTitale,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );

    //  Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     const SizedBox(
    //       height: AppSize.s40,
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(AppPading.p8),
    //       child: Text(
    //         _sliderObject.title,
    //         textAlign: TextAlign.center,
    //         style: Theme.of(context).textTheme.displayLarge,
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(AppPading.p8),
    //       child: Text(
    //         _sliderObject.subTitale,
    //         textAlign: TextAlign.center,
    //         style: Theme.of(context).textTheme.headlineMedium,
    //       ),
    //     ),
    //     SizedBox(
    //       height: AppSize.s60,
    //     ),
    //     SvgPicture.asset(_sliderObject.image)
    //   ],
    // );
  }
}

class SliderObject {
  String title;
  String subTitale;
  String image;

  SliderObject(this.title, this.subTitale, this.image);
}
