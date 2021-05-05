import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/features/doctors/controller/add_doctor_controller.dart';
import 'package:haelth_app/features/doctors/controller/add_doctor_state.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

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
          return SingleChildScrollView(
            child: Container(
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
                  SizedBox(height: 1.0.h,),
                  GestureDetector(
                    onTap: ()async{
                      DateTime d = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 350)),
                          builder: (context,child){
                            return Theme(
                              data: ThemeData.light().copyWith(colorScheme: ColorScheme.light().copyWith(primary: Colors.teal)),
                              child: child,
                            );
                          }
                      );
                      TimeOfDay t = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (context,child){
                            return Theme(
                              data: ThemeData.light().copyWith(colorScheme: ColorScheme.light().copyWith(primary: Colors.teal)),
                              child: child,
                            );
                          }
                      );
                      if(d != null && t != null) {
                        controller.date = DateTime(d.year,d.month,d.day,t.hour,t.minute);
                        setState(() {});
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 1.0.h),
                      child: Center(child: Text(controller.date == null
                          ?"قم بإضافة موعد"
                          :DateFormat("hh:mm  yyy-dd-MM").format(controller.date),
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0.h,),
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
            ),
          );
        }
      ),
    );
  }
}
