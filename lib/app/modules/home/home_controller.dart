import 'package:get/get.dart';
import 'package:sese/app/data/services/auth_service.dart';

class HomeController extends GetxController {
  var pageIdx = 0.obs;
  var sliderIdx = 0.obs;
  final List<String> sliderImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy-wMAKg-35EXBQIdWhOunOtot-1DJH2oTTw&usqp=CAU ',
    'https://www.thoughtco.com/thmb/dUZhKsB5qY5L962u-ED9553poE0=/3620x2750/filters:fill(auto,1)/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg',
    'https://thumbor.forbes.com/thumbor/711x474/https://specials-images.forbesimg.com/imageserve/992893220/Second-hand-T-shirts-on-display-at-Broadway-market-in-London/960x0.jpg?fit=scale',
  ];

  void changePage(int index) {
    pageIdx.value = index;
    update();
  }

  void changeSlider(int index) {
    sliderIdx.value = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
