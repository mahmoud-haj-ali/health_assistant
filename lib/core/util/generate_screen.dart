import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/features/doctor/presentation/page/doctor_details.dart';
import 'package:haelth_app/features/doctors/presentation/page/doctors_list.dart';
import 'package:haelth_app/features/medicines/presentation/page/medicines_list.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name;
    print("the name is $name");
    final args = value.arguments;
    switch (name) {
      case NameScreen.DOCTORS_LIST_PAGE:
        {
          return CupertinoPageRoute(builder: (context) => DoctorsListPage());
        }
      case NameScreen.DOCTOR_DETAILS_PAGE:
        {
          return CupertinoPageRoute(builder: (context) => DoctorDetailsPage(doctor: args));
        }
      case NameScreen.MEDICINES_LIST_PAGE:
        {
          return CupertinoPageRoute(builder: (context) => MedicinesListPage());
        }
      // case NameScreen.MEDICINE_DETAILS_PAGE:
      //   {
      //     return CupertinoPageRoute(builder: (context) => MedicineDetailsPage(doctor: args));
      //   }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

///
/// [NameScreen] class is responsible for declaring the routing names
///
class NameScreen {
  static const String HOME_PAGE = "/home_page";

  static const String DOCTORS_LIST_PAGE = "/doctors_list_page";

  static const String DOCTOR_DETAILS_PAGE = "/doctor_details_page";

  static const String MEDICINES_LIST_PAGE = "/medicines_list_page";

  static const String MEDICINE_DETAILS_PAGE = "/medicine_details_page";


}
