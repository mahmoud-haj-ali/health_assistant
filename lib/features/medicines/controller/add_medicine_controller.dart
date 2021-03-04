import 'dart:async';

import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/main.dart';

import 'add_medicine_state.dart';

class AddMedicineController{
  AddMedicineController(){
    _state = AddMedicineState.initially();
    _stateController.add(_state);
  }

  AddMedicineState _state = AddMedicineState.initially();
  AddMedicineState get state => _state;

  final StreamController<AddMedicineState> _stateController = StreamController<AddMedicineState>();
  Stream<AddMedicineState> get streamState => _stateController.stream;

  dispose(){
    _stateController.close();
  }

  onChangeName(String value) =>
    _stateController.add(_state..name = value..isNameValid = value.isEmpty);

  onChangeSpecialty(value) =>
      _stateController.add(_state..specialty = value);

  onChangeNumber(value) =>
      _stateController.add(_state..number = value);

  void onChangeAddress(value) =>
      _stateController.add(_state..address = value);

  Future<bool> addDoctor(Doctor doctor) async {
    if(doctor.name?.isEmpty??true) {
      _stateController.add(_state..isNameValid = true);
      return false;
    }
    bool isSuccess = true;
    await db.addDoctor(doctor).catchError((e){
      print(e);
      isSuccess = false;
    });
    return isSuccess;
  }




}
