import 'package:app_demo_get/components/default-button.dart';
import 'package:app_demo_get/size_config.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  IO.Socket socket;

  @override
  void initState() {
    super.initState();
    socket = IO.io('http://kltn-foodoffer.herokuapp.com',
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('connected');
      /*   socket.emit('UserJoin', {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjA4N2NiYTkxMmNkMDUQ.x62vHyE42iONcOn7YKh7pDtHRmOxQ_9Sbin8G1Oy0dM'
      }); */
    });
    socket.on('billMessage', (data) {
      Get.snackbar('Thông báo', data);
      print(data);
    });
  }

  /* @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    socket.onConnect((data) => print(data));
    socket.onConnectTimeout((data) => print(data));
  } */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () async {
              var token = await SPref.get(SPrefCache.KEY_TOKEN);
              print('Day la token dang nhap thanh cong \n $token');
              socket.emit('UserJoin', {'token': token});
              Get.offAll(MainPage());
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
