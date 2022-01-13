import 'package:get/state_manager.dart';
import 'package:getx_test_02/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts(); // get Date
    print('call fetchprod');
    super.onInit();
  }
  void fetchProducts() async { 
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(1,'FirstProduct','abd','some description about product',25),
      Product(2,'SecondProduct','abd','some description about product',14.5),
      Product(3,'ThirdProduct','abd','some description about product',52),
      Product(4,'FourthProduct','abd','some description about product',17.5),
      Product(5,'FifthProduct','abd','some description about product',26.5),
      Product(6,'SixthProduct','abd','some description about product',5.5)
    ];
    print('pd');
    products.assignAll(productResult); // เก็บค่าทั้งหมดลงใน products
  }
}