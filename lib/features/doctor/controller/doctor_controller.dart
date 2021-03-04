import 'dart:async';

import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/main.dart';

import 'doctor_state.dart';

class DoctorController{
  DoctorController(Doctor doctor){
    _state = DoctorState.initially(doctor);
    _stateController.add(_state);
  }

  DoctorState _state;
  DoctorState get state => _state;

  final StreamController<DoctorState> _stateController = StreamController<DoctorState>.broadcast();
  Stream<DoctorState> get streamState => _stateController.stream;

  dispose(){
    _stateController.close();
  }

  onChangeName(String value) =>
    _stateController.add(_state..name = value..isNameValid = value.isEmpty);

  onChangeSpecialty(value) =>
      _stateController.add(_state..specialty = value);

  onChangeNumber(value) =>
      _stateController.add(_state..number = value);

  onChangeAddress(value) =>
      _stateController.add(_state..address = value);

  onEdit() =>
      _stateController.add(_state..isEdit = true);

  onUpdate(int id){
    if(state.name?.isEmpty?? true){
      _stateController.add(_state..isNameValid = true);
    } else {
      Doctor doctor = Doctor(
          id: id,
          name: state.name,
          specialty: state.specialty,
          address: state.address,
          phone: state.number
      );
      db.updateDoctor(doctor);
      _stateController.add(_state..isEdit = false);
    }
  }
}
