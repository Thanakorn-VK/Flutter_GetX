import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_02/views/cart_page.dart';
import 'package:getx_test_02/controllers/cart_controller.dart';
import 'package:getx_test_02/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  final ShoppingController shoppingcontroller = Get.find();
  final CartController cartcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: shoppingcontroller.products.length,
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
                                          shoppingcontroller
                                              .products[index].productName,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white60),
                                        )),
                                    Obx(() => Text(
                                          shoppingcontroller.products[index]
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
                                          '\$${shoppingcontroller.products[index].price}',
                                          style: const TextStyle(
                                              fontSize: 28,
                                              color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          cartController.addToCart(
                                              shoppingcontroller
                                                  .products[index]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.blue),
                                        child: const Text('Add to Cart')),
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
              height: 100,
              width: 400,
              color: Colors.grey.shade100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 0,
                      ),
                      Container(
                        color: Colors.white,
                        height: 44,
                        width: 179,
                        alignment: Alignment.centerLeft,
                        child: Obx(() => Text(
                              '  Total Price : ${cartController.totalPrice} \$',
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black87),
                            )),
                      ),
                      Container(
                        color: Colors.white,
                        height: 44,
                        width: 179,
                        alignment: Alignment.centerLeft,
                        child: Obx(() => Text(
                              '  Amount : ${cartController.count.toString()}',
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.black87),
                            )),
                      ),
                      const SizedBox(
                        height: 0,
                      )
                    ],
                  ),
                  Container(
                    //color: Colors.blue,
                    height: 88,
                    width: 179,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(CartPage());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange.shade400,
                            minimumSize: const Size(178, 86),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_cart,
                                size: 60,
                              ),

                              // Obx(() => Text(
                              //       cartController.count.toString(),
                              //       style: const TextStyle(
                              //           fontSize: 22, color: Colors.white),
                              //     )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
