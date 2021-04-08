import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/features/doctor/controller/doctor_controller.dart';
import 'package:haelth_app/features/doctor/controller/doctor_state.dart';
import 'package:haelth_app/features/doctor/presentation/widget/details.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';

class DoctorDetailsPage extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetailsPage({Key key,this.doctor}) : super(key: key);

  @override
  _DoctorDetailsPageState createState() => _DoctorDetailsPageState(doctor: doctor);
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {

  Doctor doctor;
  _DoctorDetailsPageState({this.doctor});

  DoctorController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DoctorController(doctor);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=>_controller,
      dispose: (_,c)=>c.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(doctor.name),
          actions: [
            StreamBuilder(
              stream: _controller.streamState,
              initialData: DoctorState.initially(doctor),
              builder: (context,snapshot){
                if(snapshot.data.isEdit)
                  return FlatButton(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("حفظ",style: TextStyle(color: Colors.white),),
                    onPressed: () => _controller.onUpdate(doctor.id),
                  );
                else
                  return IconButton(icon: Icon(Icons.edit),onPressed: () => _controller.onEdit(),);
              },
            ),
          ],
        ),
        body: DoctorDetailsFields(doctor: doctor),
        floatingActionButton: floatingButton(),
      ),
    );
  }

  Widget floatingButton(){
    return FloatingActionButton(
      child: Icon(Icons.add,size: 35,),
      onPressed: ()async{
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
          DateTime date = DateTime(d.year,d.month,d.day,t.hour,t.minute);
          db.addDate(Date(date: date, doctorId: doctor.id,title: 'لديك موعد عند الطبيب ${doctor.name}'));
        }
      },
    );
  }

}
