import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
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
  int _currentIndex = 0;

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
        elevation: 0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: ColorManager.white,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _currentIndex,
        onPageChanged: (value) {
          _currentIndex = value;
        },
        itemBuilder: (context, index) {
          return OnBordingPage(_list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppString.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            )
            
         
          ],
        ),
      ),
    );
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
  }
}

class SliderObject {
  String title;
  String subTitale;
  String image;

  SliderObject(this.title, this.subTitale, this.image);
}
