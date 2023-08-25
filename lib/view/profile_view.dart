import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                  image: controller.userModel == null
                                      ? const AssetImage("assets/images/Avatar.png")
                                      : controller.userModel.picture ==
                                              "default"
                                          ? const AssetImage(
                                              "assets/images/Avatar.png") as ImageProvider
                                          : NetworkImage(
                                              "${controller.userModel.picture}"),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: "Baraa Aldarsani",
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              CustomText(
                                text: "baraaaldr@gmail.com",
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Image.asset(
                            "assets/menu_icon/Icon_Edit-Profile.png"),
                        title: Text("Edit Profile"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: () {},
                        leading:
                            Image.asset("assets/menu_icon/Icon_Location.png"),
                        title: Text("Shipping Addres"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: () {},
                        leading:
                            Image.asset("assets/menu_icon/Icon_History.png"),
                        title: Text("Order History"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: () {},
                        leading:
                            Image.asset("assets/menu_icon/Icon_Payment.png"),
                        title: Text("Cards"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Image.asset("assets/menu_icon/Icon_Alert.png"),
                        title: Text("Notifications"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: () {
                          controller.signOut();
                          Get.offAll(LoginScreen());
                        },
                        leading: Image.asset("assets/menu_icon/Icon_Exit.png"),
                        title: const Text("Log Out"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
