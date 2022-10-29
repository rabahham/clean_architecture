// onBordingModel
class SliderObject {
  String title;
  String subTitale;
  String image;

  SliderObject(this.title, this.subTitale, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberSliders;
  int currntIndex;
  SliderViewObject({
    required this.sliderObject,
    required this.numberSliders,
    required this.currntIndex,
  });
}
