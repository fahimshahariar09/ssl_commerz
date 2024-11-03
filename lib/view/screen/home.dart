import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssl_commerz/controller/ui_controller/home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Ssl Commerz"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              debugPrint(".............start..........");
              await homeController.sslCommerzGeneralCall();
              debugPrint(".............end..........");
            }, child: Text("PAY NOW"))
          ],
        ),
      ),
    );
  }
}
