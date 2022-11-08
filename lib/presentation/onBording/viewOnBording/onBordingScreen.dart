// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:clean_architecture/domain/models/models.dart';
import 'package:clean_architecture/presentation/onBording/viewmodelonbording/onbording_viewmodel.dart';
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
  final PageController _pageController = PageController();

  final OnBordingViewModel _viewModel = OnBordingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: ((context, snapshot) {
          return _getContentWidget(snapshot.data);
        }));
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container(
        child: Center(child: Text('jjjjjjjj')),
      );
    } else
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
          itemCount: sliderViewObject.numberSliders,
          onPageChanged: (value) {
            _viewModel.onPageChanged(value);
          },
          itemBuilder: (context, index) {
            return OnBordingPage(sliderViewObject.sliderObject);
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
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
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
                // go to  previous slide

                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration:
                        Duration(microseconds: AppConstants.sliderInimait),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numberSliders; i++)
                Padding(
                  padding: EdgeInsets.all(AppPading.p8),
                  child: _getProperCircle(i, sliderViewObject.currntIndex),
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
                _pageController.animateToPage(_viewModel.goNext(),
                    duration:
                        Duration(microseconds: AppConstants.sliderInimait),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollow_circle_ic);
    } else {
      return SvgPicture.asset(ImageAssets.solid_circle_ic);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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
