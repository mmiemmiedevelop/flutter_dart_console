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

  void addToCart(String name, String count) {
    //널처리나 형변환은 안쪽 메쏘드에서 진행
    //[상품이름]예외처리
    if (name.trim().isEmpty) {
      print('입력값이 올바르지 않아요 !');
      return;
    }
    //[상품갯수] 형변환 + 예외처리
    try {
      int value = int.parse(count);
      if (value <= 0) {
        throw FormatException('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      }
    } on FormatException catch (e) {
      print(e.message);
      return;
    } catch (e) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    // //사용자인풋 받아오기
    // int eachProductPrice = productList
    //     .firstWhere((product) => product.productName == '셔츠')
    //     .productPrice;
    // int eachAdd = eachProductPrice * count.toInt();
    print('$name $count 오키오키');
  }

  void showTotalPrice() {
    print('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }
}
