import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:haelth_app/core/util/custom_list_tile.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/features/doctors/presentation/widget/add_doctor_dialog.dart';
import 'package:haelth_app/main.dart';

class DoctorsListPage extends StatefulWidget {

  @override
  _DoctorsListPageState createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {

  @override
  Widget build(BuildContext context) {
    final floatingButton = FloatingActionButton(
      onPressed: (){
        showDialog(
          context: context,
          builder: (_) => AddDoctorDialog());
      },
      child: Icon(Icons.add),
    );
    final body = Container(
      child: StreamBuilder(
        stream: db.watchAllDoctors,
        builder: (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
          List<Doctor> doctors = snapshot.data??[];
          if(doctors.isEmpty)
            return Center(
              child: Text("لا يوجد اطباء مضافة\nإضغط على + لإضافة طبيب",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,height: 1.5),),
            );
          return ListView.separated(
            itemCount: doctors.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,80.0),
            itemBuilder: (context,i){
              return CustomListTile(
                title: "اسم الطبيب: ${doctors[i].name}",
                subtitle: "الاختصاص: ${doctors[i].specialty}",
                onTap: (){
                  Navigator.pushNamed(context, NameScreen.doctor_details_page,arguments: doctors[i]);
                },
                onIconTap: (){
                  showDialog(context: context,
                      builder: (cxt) => AlertDeleteDialog(
                        onDelete: ()=>db.deleteDoctor(doctors[i].id),
                      ));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
          );
        },
      ),
    );
    final appBar = AppBar(
      centerTitle: true,
      title: Text("أطبائك"),
    );
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingButton,
    );
  }

}
