import 'product.dart';

class Shoppingmall {
  int totalPrice = 0;
  List<Product> productList = [];

  void showProducts() {}

  void addToCart() {}

  void showTotalPrice() {
    print('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }
}
