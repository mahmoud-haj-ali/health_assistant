import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/features/doctor/controller/doctor_controller.dart';
import 'package:haelth_app/features/doctor/presentation/widget/dates_list.dart';
import 'package:provider/provider.dart';

import 'dates_list.dart';
import 'doctor_info.dart';

class DoctorDetailsFields extends StatelessWidget {

  final Doctor doctor;
  const DoctorDetailsFields({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<DoctorController>(context);
    return Column(
      children: [
        StreamBuilder(
          stream: _controller.streamState,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                    initialValue: doctor.name,
                    onChanged: _controller.onChangeName,
                    enabled: _controller.state.isEdit,
                    textInputAction: TextInputAction.next,
                    labelText: "اسم الطبيب",
                  ),
                  if(!_controller.state.isNameValid)
                    Align(alignment:Alignment(0.95,0.0),
                        child: Text("يرجى إدخال اسم",style: TextStyle(color: Colors.red,fontSize: 12,height: 0.5),)),
                  CustomTextField(
                    initialValue: doctor.specialty,
                    onChanged: _controller.onChangeSpecialty,
                    enabled: _controller.state.isEdit,
                    textInputAction: TextInputAction.next,
                    labelText: "اختصاص الطبيب",
                  ),
                  CustomTextField(
                    initialValue: doctor.phone,
                    onChanged: _controller.onChangeNumber,
                    enabled: _controller.state.isEdit,
                    textInputAction: TextInputAction.next,
                    labelText: "رقم الطبيب",
                  ),
                  CustomTextField(
                    initialValue: doctor.address,
                    onChanged: _controller.onChangeAddress,
                    enabled: _controller.state.isEdit,
                    labelText: "عنوان الطبيب",
                  ),
                ],
              ),
            );
          }
        ),
        DoctorInfoWidget(doctor: doctor),
        DatesListWidget(doctor: doctor)
      ],
    );
  }
}
