import 'package:get/state_manager.dart';
import 'package:getx_test_02/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  
  double get totalPrice{
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }
  int get count{
    return cartItems.length;
  }
  int getlength(){
    return cartItems.length;
  }
  addToCart(Product? product) {
    cartItems.add(product!); 
  }
  remove(){
    cartItems.clear();
  }
  removeCart(int? index){
    cartItems.removeAt(index!);
  }
}
