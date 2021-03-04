
class AddMedicineState{
  String name;
  String number;
  String specialty;
  String address;
  bool isNameValid;

  AddMedicineState({this.name, this.number, this.specialty, this.address,this.isNameValid});

  factory AddMedicineState.initially() =>
      AddMedicineState(
          isNameValid: false
      );
}