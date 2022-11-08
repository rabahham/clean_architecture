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

// login models

class Customer {
  String id;

  String name;

  int numOFNotification;
  Customer(this.id, this.name, this.numOFNotification);
}

// login Contacts

class Contacts {
  String phone;

  String email;

  String link;
  Contacts(this.phone, this.email, this.link);
}

// login Authentication

class Authentication {
  Customer? customer;

  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
