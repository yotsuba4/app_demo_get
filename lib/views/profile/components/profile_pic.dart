import 'package:app_demo_get/controllers/auth-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  AuthController profilerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            // ignore: deprecated_member_use
            overflow: Overflow.visible,
            children: [
              profilerController.isLoading.value
                  ? CircleAvatar(
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )),
                    )
                  : CircleAvatar(
                      backgroundImage:
                          NetworkImage(profilerController.user.value.avatar)),
              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera),
                                title: Text('Camera'),
                                onTap: () {
                                  Get.back();
                                  profilerController
                                      .uploadImage(ImageSource.camera);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text('Gallery'),
                                onTap: () {
                                  Get.back();
                                  profilerController
                                      .uploadImage(ImageSource.gallery);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
