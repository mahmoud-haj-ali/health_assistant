
import 'package:haelth_app/core/data_base/db/moor_db.dart';

class DoctorState{
  String name;
  String number;
  String specialty;
  String address;
  bool isNameValid;
  bool isEdit;

  DoctorState({this.name, this.number, this.specialty, this.address,this.isNameValid,this.isEdit});


  factory DoctorState.initially([Doctor doctor]) =>
      DoctorState(
        isNameValid: false,
        isEdit:false,
        name: doctor?.name,
        number: doctor?.phone,
        address: doctor?.address,
        specialty: doctor?.specialty
      );
}