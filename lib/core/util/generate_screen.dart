import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/tables/analysis_name_t.dart';
import 'package:haelth_app/features/analysis/add_analysis_page.dart';
import 'package:haelth_app/features/analysis/analysis_dates_page.dart';
import 'package:haelth_app/features/analysis/analysis_details_page.dart';
import 'package:haelth_app/features/analysis/analysis_names_page.dart';
import 'package:haelth_app/features/diet/add_diet_page.dart';
import 'package:haelth_app/features/diet/diet_list_page.dart';
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
      case NameScreen.analysis_name_list_page:
        {
          return CupertinoPageRoute(builder: (context) => AnalysisNamesPage());
        }
      case NameScreen.analysis_dates_list_page:
        {
          return CupertinoPageRoute(builder: (context) => AnalysisDatesPage(name: args,));
        }
      case NameScreen.add_analysis_page:
        {
          return CupertinoPageRoute(builder: (context) => AddAnalysisPage());
        }
      case NameScreen.analysis_details_page:
        {
          return CupertinoPageRoute(builder: (context) => AnalysisDetailsPage(analysis: args,));
        }
      case NameScreen.add_diet_page:
        {
          return CupertinoPageRoute(builder: (context) => AddDietPage());
        }
      case NameScreen.diet_list_page:
        {
          return CupertinoPageRoute(builder: (context) => DietListPage());
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

  static const String analysis_name_list_page = "/analysis_name_list_page";

  static const String analysis_dates_list_page = "/analysis_dates_list_page";

  static const String add_analysis_page = "/add_analysis_page";

  static const String analysis_details_page = "/analysis_details_page";

  static const String add_diet_page = "/add_diet_page";

  static const String diet_list_page = "/diet_list_page";


}
