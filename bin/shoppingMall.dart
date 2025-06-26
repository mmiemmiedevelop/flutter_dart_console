import 'product.dart';

class Shoppingmall {
  List<IProduct> cartList = [];
  int totalPrice = 0;
  List<IProduct> productList = [
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
    //[장바구니 담기]
    cartList.add(Product(name, eachProductPrice));
    print('장바구니에 상품이 담겼어요 !');
  }

  void showTotalPrice() {
    print('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }

  void resetProduct() {
    if (totalPrice > 0) {
      totalPrice = 0;
      cartList.clear();
      print('장바구니를 초기화합니다.');
    } else {
      print('이미 장바구니가 비어있습니다.');
    }
  }

  bool exitShopping(String? input) {
    if (input == '5') {
      print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
      return false;
    } else {
      print('종료하지 않습니다.');
      return true;
    }
  }

  void currentCart() {
    if (cartList.isNotEmpty) {
      print(
        '장바구니에 ${cartList.map((product) => product.productName).join(', ')}가 담겨있네요. 총 [${totalPrice}]원 입니다!',
      );
    } else {
      print('장바구니에 담긴 상품이 없습니다.');
    }
  }
}
