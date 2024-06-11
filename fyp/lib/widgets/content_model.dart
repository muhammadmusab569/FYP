class UndoardingConent{
  String image;
  String title;
  String description;
  UndoardingConent({required this.description,required this.image,required this.title});
}


List<UndoardingConent> contents = [
  UndoardingConent(description: 'Pick your food from our menu\nMore than 35 times', image: "assets/images/screen1.png", title: "Select from Our\nBest Menu"),
  UndoardingConent(description: "You can pay cash on delivery and\nCard payment is available", image: 'assets/images/screen2.png', title: "Ease and Online Payment"),
  UndoardingConent(description: "Deliver your food at your\nDoorsteps", image: 'assets/images/screen3.png', title: "Quick Delivery at Your Doorstep"),
];