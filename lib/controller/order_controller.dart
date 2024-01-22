import 'package:get/get.dart';

class OrderController extends GetxController {
  var quantity = 0.obs;
  increment() => quantity++;
  decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
