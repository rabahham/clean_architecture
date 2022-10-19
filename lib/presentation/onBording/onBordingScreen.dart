import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                AppString.onBordingTatile1,
                style: getSemiBoldStyle(
                    color: ColorManager.darkGrey, fontSize: 20),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                AppString.onBordingSubTatile1,
                style: getRegularStyle(color: ColorManager.darkGrey),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderObject {
  String title;
  String subTitale;
  String image;

  SliderObject(this.title, this.subTitale, this.image);
}
