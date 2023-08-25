import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/products_model.dart';
import 'package:e_commerce/view/widgets/custom_Button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel? detailsmodel;

  DetailsView({this.detailsmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.network("${detailsmodel!.image}"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CustomText(
                    text: "${detailsmodel!.name}",
                    fontSize: 25,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width * .40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: "Sized",
                            ),
                            CustomText(
                              text: "XL",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width * .40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: "Color",
                            ),
                            Container(
                              height: 25,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: detailsmodel!.color,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: "${detailsmodel!.description}",
                    maxLine: 5,
                    height: 2.5,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "PRICE",
                    ),
                    CustomText(
                      text: "\$ ${detailsmodel!.price}",
                      color: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      width: 130,
                      height: 40,
                      alignment: Alignment.center,
                      child: CustomButton(
                        onPressed: () {
                          controller.addProduct(CartProductModel(
                              name: detailsmodel!.name,
                              image: detailsmodel!.image,
                              price: detailsmodel!.price,
                              quantity: 1,
                              productId: detailsmodel!.productId));
                        },
                        text: "Add",
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
