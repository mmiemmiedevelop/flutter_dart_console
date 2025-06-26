//[DIP] 의존성 역전 원칙 적용
//ShoppingMall 클래스는 Product 클래스에 '직접'의존하지 않고,
//IProduct 인터페이스를 통해 의존성을 역전시킨다.
//추후 새로운 상품타입이 필요할 때 확장에 유리함
abstract class IProduct {
  //인터페이스
  String get productName;
  int get productPrice;
}

class Product implements IProduct {
  //구현체
  @override
  final String productName;
  @override
  final int productPrice;

  Product(this.productName, this.productPrice);
}
