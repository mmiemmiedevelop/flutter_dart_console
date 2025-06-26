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

  void addToCart(String? name, String? count) {
    //널처리나 형변환은 안쪽 메쏘드에서 진행
    //[상품이름]예외처리
    if (name == null || name.trim().isEmpty || count == null) {
      print('입력값이 올바르지 않아요 !');
      return;
    }
    //[상품갯수] 형변환 + 예외처리
    int countValue;
    try {
      countValue = int.parse(count);
      if (countValue <= 0) {
        throw FormatException('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      }
    } on FormatException catch (e) {
      print(e.message);
      return;
    } catch (e) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    //없는 상품명 입력했을 때 예외처리
    int eachProductPrice;
    try {
      eachProductPrice = productList
          .firstWhere((product) => product.productName == name)
          .productPrice;
    } catch (e) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    //[가격계산]
    totalPrice = eachProductPrice * countValue;
    print('장바구니에 상품이 담겼어요 !');
  }

  void showTotalPrice() {
    print('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }
}
