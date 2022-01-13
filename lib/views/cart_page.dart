import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  final CartController cartcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      backgroundColor: Colors.orange.shade300,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: cartcontroller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin:
                          const EdgeInsets.all(14), //ระยะห่างระหว่างขอบหน้าจอ
                      color: Colors.lightBlue.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(
                            16), //ระยะของขอบ Card ใน laout ข้างใน
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Text(
                                          cartcontroller
                                              .cartItems[index].productName,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white60),
                                        )),
                                    Obx(() => Text(
                                          cartcontroller.cartItems[index]
                                              .productDescription,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white60),
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Obx(() => Text(
                                          '\$${cartcontroller.cartItems[index].price}',
                                          style: const TextStyle(
                                              fontSize: 28,
                                              color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          cartController.removeCart(index);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red.shade300),
                                        child: const Text('Remove')),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                        'Total : ${cartController.totalPrice}',
                        style:
                            const TextStyle(fontSize: 28, color: Colors.black),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            cartController.remove();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange.shade400,
                            minimumSize: const Size(150, 40),
                          ),
                          child: const Text('Remove All')),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //Get.to(CartPage());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange.shade400,
                            minimumSize: const Size(150, 40),
                          ),
                          child: const Text('PAY')),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
