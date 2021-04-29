
class AddDoctorState {
  String name;
  String number;
  String specialty;
  String address;
  bool isNameValid;

  AddDoctorState({this.name, this.number, this.specialty, this.address,this.isNameValid});

  factory AddDoctorState.initially() =>
      AddDoctorState(
          isNameValid: true
      );
}