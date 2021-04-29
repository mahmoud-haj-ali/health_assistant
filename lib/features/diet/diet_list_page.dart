import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:haelth_app/core/util/custom_list_tile.dart';
import 'package:haelth_app/core/util/custom_text_field.dart';
import 'package:haelth_app/core/util/generate_screen.dart';
import 'package:haelth_app/main.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class DietListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("جميع الحميات"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('إضافة حمية',style: TextStyle(height: 2),),
        highlightElevation: 0,
        onPressed: (){
          Navigator.pushNamed(context, NameScreen.add_diet_page);
        },
      ),
      body: StreamBuilder<List<Diet>>(
        stream: db.watchAllDiets,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          final diets = snapshot.data ?? [];
          if(diets.isEmpty)
            return Center(child: Text('لايوجد حميات مضافة'));
          return ListView.separated(
            itemCount: diets.length,
            padding: EdgeInsets.only(bottom: 60,left: 5,right: 5,top: 5),
            physics: BouncingScrollPhysics(),
            separatorBuilder: (_,__) => SizedBox(height: 10,),
            itemBuilder: (context,i){
              return CustomListTile(
                title: "الحمية: ${diets[i].name}",
                subtitle: "الوصف: ${diets[i].description}",
                icon: Icons.medical_services_outlined,
                onTap: (){
                  showDietDetails(context, diets[i]);
                },
                onIconTap: (){
                  showDialog(context: context,
                      builder: (cxt) => AlertDeleteDialog(
                        onDelete: ()=> db.deleteDiet(diets[i].id),
                      ));
                },
              );
            },
          );
        }
      ),
    );
  }

  showDietDetails(context,Diet diet){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      builder: (context){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0.h,horizontal: 4.0.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(flex:2, child: Divider(color: Colors.teal,endIndent: 10,thickness: 1.5,)),
                    Expanded(child: Center(child: Text(diet.name,style: TextStyle(fontSize: 25.0.sp,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor)))),
                    Expanded(flex:2, child: Divider(color: Colors.teal,indent: 10,thickness: 1.5,)),
                  ],
                ),
                showWrapContent(title: 'الادوية المصاحبة للحمية',dietId: diet.id,isAllowed: true, isMedicines: true),
                showWrapContent(title: 'الادوية الممنوعة',dietId: diet.id,isAllowed: false, isMedicines: true),
                showWrapContent(title: 'الاطعمة المسموحة',dietId: diet.id,isAllowed: true, isMedicines: false),
                showWrapContent(title: 'الاطعمة الممنوعة',dietId: diet.id,isAllowed: false, isMedicines: false),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26,width: 0.4),
                      borderRadius: BorderRadius.circular(10.0),
                      // color: Colors.grey[200]
                  ),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.fromLTRB(10.0,5.0,10.0,7.0),
                  margin: EdgeInsets.only(bottom: 1.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('مدة الحمية',style: TextStyle(color: Colors.black87,fontSize: 13),),
                      SizedBox(height: 5,),
                      Center(
                        child: Text("${DateFormat('yyyy-MM-dd').format(diet.startDate)}  -->  ${DateFormat('yyyy-MM-dd').format(diet.endDate)}",style: TextStyle(height: 1),),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  labelText: 'الوصف',
                  enabled: false,
                  margin: EdgeInsets.zero,
                  controller: TextEditingController(text: diet.description),
                )

              ],
            ),
          ),
        );
      }
    );
  }

  showWrapContent({String title, bool isAllowed, int dietId,bool isMedicines}){
    return FutureBuilder(
      future: isMedicines?db.getDietMedicines(dietId,isAllowed):db.getDietFoods(dietId, isAllowed),
      builder: (context,snapshot){
        final list = snapshot.data??[];
        if(list.isEmpty)
          return SizedBox.shrink();
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26,width: 0.4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.only(bottom: 1.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 3.0.w),
                child: Text(title,style: TextStyle(color: Colors.black87,fontSize: 13),),
              ),
              Center(
                child: Wrap(
                  spacing: 7,
                  alignment: WrapAlignment.center,
                  children: [
                    for(var item in list)
                      Chip(
                        label: Text(item.name,style: TextStyle(color: Colors.teal),),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(25)),),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
