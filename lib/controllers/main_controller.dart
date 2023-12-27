import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt bottomNavBarIndex = 0.obs;
  RxInt selectedCurrencyPage = 0.obs;

  setIndex(int value) {
    bottomNavBarIndex.value = value;
  }
}
