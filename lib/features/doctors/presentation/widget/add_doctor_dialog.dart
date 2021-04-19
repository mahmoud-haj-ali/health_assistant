import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/features/doctors/controller/add_doctor_controller.dart';
import 'package:haelth_app/features/doctors/controller/add_doctor_state.dart';

class AddDoctorDialog extends StatefulWidget {

  @override
  _AddDoctorDialogState createState() => _AddDoctorDialogState();
}

class _AddDoctorDialogState extends State<AddDoctorDialog> {

  final AddDoctorController controller = AddDoctorController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: StreamBuilder<AddDoctorState>(
        stream: controller.streamState,
        initialData: AddDoctorState.initially(),
        builder: (context, snapshot) {
          AddDoctorState state = snapshot.data;
          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("يرجى ملئ البيانات التالية:",style: TextStyle(fontWeight: FontWeight.w600),),
                CustomTextField(
                  onChanged: (value){
                    controller.onChangeName(value);
                  },
                  textInputAction: TextInputAction.next,
                  labelText: "إسم الطبيب",
                ),
                if(!state.isNameValid)
                  Text("يرجى إدخال اسم",style: TextStyle(color: Colors.red,fontSize: 12,height: 0.5),),
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
                  maxLines: 1,
                  labelText: "عنوان الطبيب",
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
