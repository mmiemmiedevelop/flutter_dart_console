import 'package:test/test.dart';
import '../bin/shoppingMall.dart';
import '../bin/product.dart';

void main() {
  group('Shoppingmall', () {
    late Shoppingmall shoppingMall;

    setUp(() {
      shoppingMall = Shoppingmall();
    });

    test('상품 목록이 올바르게 출력되는지 확인', () {
      // 상품 목록이 5개인지 확인
      expect(shoppingMall.productList.length, 5);
      expect(shoppingMall.productList[0].productName, '셔츠');
    });

    test('올바른 상품과 개수로 장바구니에 담으면 장바구니에 추가된다', () {
      shoppingMall.addToCart('셔츠', '2');
      expect(shoppingMall.cartList.isNotEmpty, true);
      expect(shoppingMall.cartList[0].productName, '셔츠');
      expect(shoppingMall.totalPrice, 45000 * 2);
    });

    test('없는 상품명이나 잘못된 개수 입력시 장바구니에 추가되지 않는다', () {
      shoppingMall.addToCart('없는상품', '2');
      expect(shoppingMall.cartList.isEmpty, true);
      shoppingMall.addToCart('셔츠', '0');
      expect(shoppingMall.cartList.isEmpty, true);
      shoppingMall.addToCart('셔츠', 'abc');
      expect(shoppingMall.cartList.isEmpty, true);
    });

    test('장바구니 초기화가 정상 동작한다', () {
      shoppingMall.addToCart('셔츠', '1');
      shoppingMall.resetProduct();
      expect(shoppingMall.cartList.isEmpty, true);
      expect(shoppingMall.totalPrice, 0);
    });

    test('exitShopping 입력값에 따라 true/false 반환', () {
      expect(shoppingMall.exitShopping('5'), false);
      expect(shoppingMall.exitShopping('아무거나'), true);
    });
  });
}
