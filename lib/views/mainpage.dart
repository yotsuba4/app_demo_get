import 'package:app_demo_get/controllers/auth-controller.dart';
import 'package:app_demo_get/controllers/main-page-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/home/home-page.dart';
import 'package:app_demo_get/views/notifications/notification.dart';
import 'package:app_demo_get/views/profile/profile.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:app_demo_get/views/voucher/voucher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthController authController = Get.put(AuthController());
  MainPageController mainPageController = Get.put(MainPageController());
  @override
  void initState() {
    super.initState();
    mainPageController.getToken();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(360, 640),
      orientation: Orientation.portrait,
    );
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.primary,
            unselectedItemColor: Colors.grey.shade300,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            currentIndex: mainPageController.currentIndex.value,
            onTap: (index) {
              if (index == 3) {
                if (mainPageController.token == null ||
                    mainPageController.token == '')
                  Get.to(SignInPage());
                else {
                  authController.getProfile();
                  Get.to(ProfileScreen());
                }
              } else {
                mainPageController.currentIndex.value = index;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: "hot".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pageview),
                label: "voucher".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_important),
                label: "notification".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_ind),
                label: "profile".tr,
              )
            ],
            type: BottomNavigationBarType.fixed,
          ),
          body: getBodyWidget(),
        ));
  }

  getBodyWidget() {
    if (mainPageController.currentIndex.value == 0) {
      return HomePage();
    } else if (mainPageController.currentIndex.value == 1) {
      return VoucherPage();
    } else {
      return NotificationPage();
    }
  }
}
