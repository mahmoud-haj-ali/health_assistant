import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:haelth_app/core/util/custom_list_tile.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/main.dart';



class MedicinesListPage extends StatefulWidget {
  @override
  _MedicinesListPageState createState() => _MedicinesListPageState();
}

class _MedicinesListPageState extends State<MedicinesListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("أدويتك"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: db.watchAllMedicines,
          builder: (BuildContext context, AsyncSnapshot<List<Medicine>> snapshot) {
            List<Medicine> medicines = snapshot.data ?? [];
            if(medicines.isEmpty)
              return Center(
                child: Text("لا يوجد ادوية مضافة\nإضغط على + لإضافة دواء",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,height: 1.5),),
              );
            return ListView.separated(
              itemCount: medicines.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,80.0),
              itemBuilder: (context, i){
                return CustomListTile(
                  title: "اسم الدواء: ${medicines[i].name}",
                  subtitle: "ملاحظات: ${medicines[i].notes}",
                  icon: Icons.medical_services_outlined,
                  onTap: (){
                    Navigator.pushNamed(context, NameScreen.medicine_details_page,arguments: medicines[i]);
                  },
                  onIconTap: (){
                    showDialog(context: context,
                        builder: (cxt)=> AlertDeleteDialog(
                          onDelete: ()=>db.deleteMedicine(medicines[i].id),
                        ));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, NameScreen.add_medicine_page);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
