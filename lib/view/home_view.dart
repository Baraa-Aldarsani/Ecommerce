import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      children: [
                        _textSearch(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Categories",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _listCategories(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Best Selling",
                              fontSize: 20,
                            ),
                            CustomText(
                              text: "See all",
                              fontSize: 15,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        _listProduct(),
                      ],
                    )),
              ),
            ),
    );
  }

  Widget _textSearch() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listCategories() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 110,
        child: ListView.separated(
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(400),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        "${controller.categoryModel[index].image}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "${controller.categoryModel[index].name}",
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                )),
      ),
    );
  }

  Widget _listProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 250,
        child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(DetailsView(
                    detailsmodel: controller.productModel[index],
                  ));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, right: 10),
                          child: Image.network(
                            "${controller.productModel[index].image}",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "${controller.productModel[index].name}",
                      ),
                      Expanded(
                        child: CustomText(
                          text: "${controller.productModel[index].description}",
                          fontSize: 12,
                          color: Colors.grey,
                          alignment: Alignment.bottomLeft,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: "${controller.productModel[index].price} \$",
                        alignment: Alignment.bottomLeft,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                )),
      ),
    );
  }
}
