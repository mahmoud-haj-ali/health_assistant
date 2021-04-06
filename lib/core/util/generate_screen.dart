import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/features/doctor/presentation/page/doctor_details.dart';
import 'package:haelth_app/features/doctors/presentation/page/doctors_list.dart';
import 'package:haelth_app/features/medicines/presentation/page/add_medicine.dart';
import 'package:haelth_app/features/medicines/presentation/page/medicine_details.dart';
import 'package:haelth_app/features/medicines/presentation/page/medicines_list.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name;
    print("the name is $name");
    final args = value.arguments;
    switch (name) {
      case NameScreen.doctors_list_page:
        {
          return CupertinoPageRoute(builder: (context) => DoctorsListPage());
        }
      case NameScreen.doctor_details_page:
        {
          return CupertinoPageRoute(builder: (context) => DoctorDetailsPage(doctor: args));
        }
      case NameScreen.medicines_list_page:
        {
          return CupertinoPageRoute(builder: (context) => MedicinesListPage());
        }
      case NameScreen.add_medicine_page:
        {
          return CupertinoPageRoute(builder: (context) => AddMedicinePage(medicine: args,));
        }
      case NameScreen.medicine_details_page:
        {
          return CupertinoPageRoute(builder: (context) => MedicineDetails(m: args,));
        }

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
  static const String home_page = "/home_page";

  static const String doctors_list_page = "/doctors_list_page";

  static const String doctor_details_page = "/doctor_details_page";

  static const String medicines_list_page = "/medicines_list_page";

  static const String medicine_details_page = "/medicine_details_page";

  static const String add_medicine_page = "/add_medicine_page";


}
