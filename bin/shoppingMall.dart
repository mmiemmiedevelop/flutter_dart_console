import 'product.dart';

class Shoppingmall {
  int totalPrice = 0;
  List<Product> productList = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  void showProducts() {
    for (var product in productList) {
      print('${product.productName} / ${product.productPrice}원');
    }
  }

  void addToCart() {}

  void showTotalPrice() {
    print('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }
}
