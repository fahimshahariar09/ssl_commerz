import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        store_id: "store_id",
        store_passwd: "store_passwd",
        total_amount: 100,
        currency: "currency",
        tran_id: "tran_id",
        product_category: "product_category",
        sdkType: "sdkType",
      ),
    );
  }
}
