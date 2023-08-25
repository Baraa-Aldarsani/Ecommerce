import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
      body: controller.cartProductModel.isEmpty
          ? Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/cart_view.svg",width: 200,height: 200,),
              const SizedBox(height: 30,),
              CustomText(text: "Cart Empty",fontSize: 25,alignment: Alignment.topCenter,)
            ],
          )
          : Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: ListView.separated(
                  itemCount: controller.cartProductModel.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Image.network(
                                  "${controller.cartProductModel[index].image}")),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    "${controller.cartProductModel[index].name}",
                              ),
                              CustomText(
                                text:
                                    "\$ ${controller.cartProductModel[index].price}",
                                color: primaryColor,
                                // alignment: Alignment.bottomLeft,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                // margin: const EdgeInsets.only(right: 80),
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: GetBuilder<CartViewModel>(
                                  init: CartViewModel(),
                                  builder: (controller) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                        child: const Icon(Icons.add),
                                      ),
                                      CustomText(
                                        text:
                                            "${controller.cartProductModel[index].quantity}",
                                        alignment: Alignment.center,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (controller.cartProductModel[index]
                                                  .quantity >
                                              0) {
                                            controller.decreaseQuantity(index);
                                          }
                                        },
                                        child: const Icon(Icons.remove),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "TOTAL",
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller) => CustomText(
                          text: "\$ ${controller.totalPrice}",
                          color: primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(CheckOutView());
                      },
                      child: CustomText(
                        text: "CHECKOUT",
                        color: Colors.white,
                        alignment: Alignment.center,
                      ),
                    ),
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
