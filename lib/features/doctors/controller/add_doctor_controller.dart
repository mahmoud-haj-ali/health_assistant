import 'dart:async';

import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/notifications/notifications_servece.dart';
import 'package:haelth_app/core/util/show.dart';
import 'package:haelth_app/main.dart';

import 'add_doctor_state.dart';

class AddDoctorController{
  AddDoctorController(){
    _state = AddDoctorState.initially();
    _stateController.add(_state);
  }

  AddDoctorState _state = AddDoctorState.initially();
  AddDoctorState get state => _state;

  DateTime date;

  final StreamController<AddDoctorState> _stateController = StreamController<AddDoctorState>();
  Stream<AddDoctorState> get streamState => _stateController.stream;

  dispose(){
    _stateController.close();
  }

  onChangeName(String value) =>
    _stateController.add(_state..name = value..isNameValid = value.isNotEmpty);

  onChangeSpecialty(value) =>
      _stateController.add(_state..specialty = value);

  onChangeNumber(value) =>
      _stateController.add(_state..number = value);

  onChangeAddress(value) =>
      _stateController.add(_state..address = value);

  Future<bool> addDoctor(Doctor doctor) async {
    if(doctor.name?.trim()?.isEmpty??true) {
      _stateController.add(_state..isNameValid = false);
      return false;
    }
    if(date == null){
      showSnackBar("يرجى إضافة موعد");
      return false;
    }
    bool isSuccess = true;
    int id = await db.addDoctor(doctor).catchError((e){
      print(e);
      isSuccess = false;
    });
    if(date != null) {
      String message = 'لديك موعد عند الطبيب ${doctor.name}';
      int dateId = await db.addDate(Date(date: date, doctorId: id,title: message));
      localNotification.scheduleNotification(id: dateId,body: message, title: 'تذكر', time: date.subtract(Duration(hours: 1)));
    }
    return isSuccess;
  }




}
