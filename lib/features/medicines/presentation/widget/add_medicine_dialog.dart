import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/features/doctors/controller/add_doctor_state.dart';
import 'package:haelth_app/features/medicines/controller/add_medicine_controller.dart';
import 'package:haelth_app/features/medicines/controller/add_medicine_state.dart';

class AddMedicineDialog extends StatefulWidget {

  @override
  _AddMedicineDialogState createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends State<AddMedicineDialog> {

  final AddMedicineController controller = AddMedicineController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: StreamBuilder<AddMedicineState>(
        stream: controller.streamState,
        initialData: AddMedicineState.initially(),
        builder: (context, snapshot) {
          AddMedicineState state = snapshot.data;
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("يرجى ملئ البيانات التالية:",style: TextStyle(fontWeight: FontWeight.w600),),
                Form(
                  child: Column(
                    children: [
                      CustomTextField(
                        onChanged: (value){
                          controller.onChangeName(value);
                        },
                        textInputAction: TextInputAction.next,
                        labelText: "إسم الدواء",
                      ),
                      if(state.isNameValid)
                        Align(alignment:Alignment(0.95,0.0),
                            child: Text("يرجى إدخال اسم",style: TextStyle(color: Colors.red,fontSize: 12,height: 0.5),)),
                      CustomTextField(
                        onChanged: (value){
                          controller.onChangeNumber(value);
                        },
                        keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                        textInputAction: TextInputAction.next,
                        labelText: "رقم الطبيب",
                      ),
                      CustomTextField(
                        onChanged: (value){
                          controller.onChangeSpecialty(value);
                        },
                        textInputAction: TextInputAction.next,
                        labelText: "إختصاص الطبيب",
                      ),
                      CustomTextField(
                        onChanged: (value){
                          controller.onChangeAddress(value);
                        },
                        labelText: "عنوان الطبيب",
                      ),
                    ],

                  )
                ),

                SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RaisedButton(
                    onPressed: () async {
                      Doctor doctor = Doctor(
                          name: state.name,
                          phone: state.number,
                          address: state.address,
                          specialty: state.specialty);
                      if(await controller.addDoctor(doctor))
                        Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text("إضافة",style: TextStyle(color: Colors.white)),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
