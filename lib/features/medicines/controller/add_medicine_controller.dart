import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/notifications/notifications_servece.dart';
import 'package:haelth_app/main.dart';

class AddMedicineController{
  String name = '';

  StreamController<bool> isNameValidController = StreamController<bool>();


  Future<bool> saveMedicine({int id, String unit, int amount, DateTimeRange range, String notes, List<TimeOfDay> times, bool isAfter}) async {
    try {
      final isUpdate = id != null;
      Medicine medicine = Medicine(id: id, name: name, unit: unit, repeat: amount, startDate: range?.start, endDate: range?.end, notes: notes, isAfter: isAfter);
      if(!isUpdate) {
        id = await db.addMedicine(medicine);
      } else {
        await db.updateMedicine(medicine);
        await db.deleteMedicineReminders(id);
      }
      await Future.forEach(times, (time) async{
        int mId = await db.addMedicineReminder(
            MedicineReminder(medicineId: id, date: DateTime(0,0,0,time.hour,time.minute),
                content: 'يرجى اخذ $unit $name ${isAfter?'بعد الطعام':'قبل الطعام'}'));
        localNotification.scheduleDailyNotification(id: mId,time: DateTime(0,0,0,time.hour,time.minute),title: 'تذكر',body: 'يرجى اخذ $unit $name ${isAfter?'بعد الطعام':'قبل الطعام'}');
      });
      return true;
    }  catch (e) {
      print(e);
      return false;
    }
  }


  dispose(){
    isNameValidController.close();
  }


}
