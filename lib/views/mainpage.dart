import 'package:app_demo_get/controllers/auth-controller.dart';
import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/models/object/user.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/home/home-page.dart';
import 'package:app_demo_get/views/profile/profile.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthController authController = Get.put(AuthController());
  CartController cartController = Get.put(CartController());
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey.shade300,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _currentIndex,
        onTap: (index) async {
          var token = await SPref.get(SPrefCache.KEY_TOKEN);
          print(token);
          if (index == 4) {
            /* print('TRang dang nhap');
            Get.to(SignInPage()); */
            if (token == null)
              Get.to(SignInPage());
            else {
              AuthController.instance.getProfile(token);
              User user = await AuthController.instance.getProfile(token);
              //   print(user.avatar);
              Get.to(ProfileScreen(), arguments: user);
            }
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Nổi bật",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Yêu thích",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: "Mã giảm giá",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            label: "Cá nhân",
          )
        ],
        type: BottomNavigationBarType.fixed,
      ),
      body: getBodyWidget(),
    );
  }

  getBodyWidget() {
    if (_currentIndex == 0) {
      return HomePage();
    } else {
      return Container();
    }
  }
}
