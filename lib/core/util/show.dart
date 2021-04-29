import 'package:get/get.dart';

showSnackBar(String message){
  Get.showSnackbar(GetBar(
    message: message,
    isDismissible: true,
    duration: Duration(seconds: 3),
  ));
}