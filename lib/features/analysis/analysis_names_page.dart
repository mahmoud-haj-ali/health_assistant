import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:haelth_app/core/util/custom_list_tile.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/main.dart';
import 'package:intl/intl.dart';

class AnalysisNamesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("جميع التحاليل"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('إضافة تحليل',style: TextStyle(height: 2),),
        highlightElevation: 0,
        onPressed: (){
          Navigator.pushNamed(context, NameScreen.add_analysis_page);
        },
      ),
      body: StreamBuilder<List<AnalysisName>>(
        stream: db.watchAllAnalysisNames,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          final names = snapshot.data ?? [];
          if(names.isEmpty)
            return Center(child: Text('لايوجد تحاليل مضافة'));
          return ListView.separated(
            itemCount: names.length,
            padding: EdgeInsets.only(bottom: 60,left: 5,right: 5,top: 5),
            physics: BouncingScrollPhysics(),
            separatorBuilder: (_,__) => SizedBox(height: 10,),
            itemBuilder: (context,i){
              return CustomListTile(
                title: "اسم التحليل: ${names[i].name}",
                subtitle: "تاريخ آخر تحليل: ${DateFormat('dd-MM-yyyy').format(names[i].lastDate)}",
                icon: Icons.analytics_outlined,
                onTap: (){
                  Navigator.pushNamed(context, NameScreen.analysis_dates_list_page,arguments: names[i]);
                },
                onIconTap: (){
                  showDialog(context: context,
                      builder: (cxt) => AlertDeleteDialog(
                        subtext: 'سيتم حذف جميع تحاليل ${names[i].name}',
                        onDelete: ()=> db.deleteAnalysisName(names[i].id),
                      ));
                },
              );
            },
          );
        }
      ),
    );
  }
}