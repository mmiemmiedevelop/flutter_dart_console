import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;
import 'dart:io';
import 'shoppingMall.dart';

void main() {
  bool isRunningShopping = true;

  while (isRunningShopping) {
    stdout.write(
      '''--------------------------------------------------------------------------------------------------------
[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
--------------------------------------------------------------------------------------------------------\n''',
    );
    final input = stdin.readLineSync(); //사용자 인풋

    switch (input) {
      case '1':
        showProduct();
        break;
      case '2':
        addToCart();
        break;
      case '3':
        showTotalPrice();
        break;
      case '4':
        isRunningShopping = exitShoppingFalse();
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
        break; //Dart에서는 암묵적인 fall-through(다음으로 넘어가기) 없기때문에 switch에서 break 필수
    }
  }
}

//1.판매하는 상품 목록을 볼 수 있는 기능
void showProduct() {
  Shoppingmall().showProducts();
  for (int i = 0; i < 5; i++) {
    print('i: $i');
  }
}

//2. 상품을 장바구니에 담을 수 있는 기능
void addToCart() {
  Shoppingmall().addToCart();
}

//3. 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능
void showTotalPrice() {
  Shoppingmall().showTotalPrice();
}

//4. 쇼핑몰 프로그램을 종료할 수 있는 기능
bool exitShoppingFalse() {
  print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
  return false;
}
