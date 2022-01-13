import 'package:get/state_manager.dart';
import 'package:getx_test_02/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs; // ทำให้ cartItems เป็น observable เช่นกัน

  //double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  double get totalPrice{
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  test(){
    cartItems.fold(0, (previousValue, element) => print(element.productName));
  }

  int get count{
    return cartItems.length;
  }

  int getlength(){
    return cartItems.length;
  }
  addToCart(Product product) {
    cartItems.add(product); 
  }

  showData(){
    print(cartItems);
  }

  remove(){
    cartItems.clear();
  }

  removeCart(int index){
    cartItems.removeAt(index);
  }

}
