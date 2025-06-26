import 'dart:io';
import 'shoppingMall.dart';

void main() {
  var shoppingMall = Shoppingmall();
  bool isRunningShopping = true;

  while (isRunningShopping) {
    stdout.write(
      '''-----------------------------------------------------------------------------------------------------------------------------
[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화
-----------------------------------------------------------------------------------------------------------------------------\n''',
    );
    final input = stdin.readLineSync(); //사용자 인풋

    switch (input) {
      case '1':
        showProduct(shoppingMall);
        break;
      case '2':
        addToCart(shoppingMall);
        break;
      case '3':
        currentCart(shoppingMall);
        break;
      case '4':
        isRunningShopping = exitReAsk(shoppingMall);
        break;
      case '6':
        resetProduct(shoppingMall);
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
        break; //Dart에서는 암묵적인 fall-through(다음으로 넘어가기) 없기때문에 switch에서 break 필수
    }
  }
}

//1.판매하는 상품 목록을 볼 수 있는 기능
void showProduct(Shoppingmall shoppingMall) {
  shoppingMall.showProducts();
}

//2. 상품을 장바구니에 담을 수 있는 기능
void addToCart(Shoppingmall shoppingMall) {
  stdout.write('상품 이름을 입력해 주세요 !\n');
  final inputName = stdin.readLineSync();
  stdout.write('상품 개수를 입력해 주세요 !\n');
  final inputCount = stdin.readLineSync();

  shoppingMall.addToCart(inputName, inputCount);
}

// //3. 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능
// void showTotalPrice(Shoppingmall shoppingMall) {
//   shoppingMall.showTotalPrice();
// }

//3-1. 장바구니에 담은 상품들의 목록과 가격을 볼 수 있는 기능
void currentCart(Shoppingmall shoppingMall) {
  shoppingMall.currentCart();
}

// //4. 쇼핑몰 프로그램을 종료할 수 있는 기능
// bool exitShoppingFalse() {
//   print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
//   return false;
// }

//4-1. 쇼핑몰 프로그램을 종료할 시 한번 더 종료할 것인지 물어보는 기능
bool exitReAsk(Shoppingmall shoppingMall) {
  stdout.write('정말 종료하시겠습니까? 정말 종료하시려면 [5]를 입력해 주세요.\n');
  final exitInput = stdin.readLineSync();
  return shoppingMall.exitShopping(exitInput);
}

//6. 장바구니를 초기화할 수 있는 기능
void resetProduct(Shoppingmall shoppingMall) {
  shoppingMall.resetProduct();
}
