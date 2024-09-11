import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        ipn_url: "www.ipnurl.com",
        store_id: "store_id", //account id name ssl
        store_passwd: "store_passwd", //account id pass ssl
        multi_card_name: "visa",
        total_amount: 100,
        currency: SSLCurrencyType.BDT,
        tran_id: "1254789635",
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
      ),
    );

    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();

      if (result.status!.toLowerCase() == "failed") {
        Fluttertoast.showToast(
          msg: "transaction failed....",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 15,
        );
      }else if(result.status!.toLowerCase()=="closed"){
        Fluttertoast.showToast(msg: "SDK Closed by User",
        toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 15,
        );
      }else{
        Fluttertoast.showToast(msg: "Transaction is ${result.status} and amount is ${result.amount}",
        toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
