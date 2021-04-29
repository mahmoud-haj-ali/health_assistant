import 'package:flutter/material.dart';
import 'package:haelth_app/core/data_base/db/moor_db.dart';
import 'package:haelth_app/core/util/alert_delete_dialog.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';

class DatesListWidget extends StatelessWidget {

  final Doctor doctor;
  const DatesListWidget({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
              SizedBox(width: 5,),
              Text("المواعيد",style: TextStyle(fontSize: 20),),
              SizedBox(width: 5,),
              Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
            ],
          ),
          Expanded(
            child: StreamBuilder<List<Date>>(
              stream: db.watchAllDoctorDates(doctor.id),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  return Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator(strokeWidth: 1,),),
                  );
                List<Date> dates = snapshot.data?.reversed?.toList() ?? [];
                if(dates.isEmpty)
                  return Center(
                    child: Text("لا يوجد مواعيد\nإضغط على + لإضافة موعد",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,height: 1.5),),
                  );
                return ListView.separated(
                  itemCount: dates.length,
                  padding: EdgeInsets.only(bottom: 60,left: 5,right: 5),
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (_,__) => SizedBox(height: 10,),
                  itemBuilder: (context,i){
                    return Material(
                      elevation: 3,
                      color: dates[i].date.isBefore(DateTime.now())?Colors.grey.shade400:Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(DateFormat("yyyy-MM-dd").format(dates[i].date), style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                        subtitle: Text(DateFormat("hh:mm").format(dates[i].date), style: TextStyle(fontSize: 14),),
                        leading: Icon(Icons.date_range,size: 25,color: dates[i].date.isBefore(DateTime.now())?Colors.white:Theme.of(context).primaryColor,),
                        dense: true,
                        trailing: IconButton(
                          icon: Icon(Icons.cancel_rounded,color: Colors.red.shade800,),
                          iconSize: 25,
                          onPressed: (){
                            showDialog(context: context,
                                builder:(cxt) => AlertDeleteDialog(
                                    onDelete: () => db.deleteDate(dates[i].id)
                                ));
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DoctorInfoWidget extends StatelessWidget {

  final Doctor doctor;
  const DoctorInfoWidget({Key key, this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
              SizedBox(width: 5,),
              Text("التفاصيل",style: TextStyle(fontSize: 20),),
              SizedBox(width: 5,),
              Flexible(child: Divider(color: Colors.black54,thickness: 2,)),
            ],
          ),
          FutureBuilder<List<List>>(
            future: Future.wait([db.getDoctorMedicines(doctor.id), db.getDoctorAnalysis(doctor.id)]),
            builder: (context, snapshot) {
              List<Medicine> medicines = [];
              List<Analysis> analysis = [];
              if(snapshot.hasData){
                medicines = snapshot.data[0] ?? [];
                analysis = snapshot.data[1] ?? [];
              }
              if(!snapshot.hasData) {
                  return Container(
                    height: 10.0.h,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if(medicines.isEmpty && analysis.isEmpty){
                return Container(
                  height: 10.0.h,
                  child: Center(child: Text("لايوجد تفاصيل")),
                );
              } else {
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(analysis.isEmpty?"لايوجد تحاليل يشرف عليها":"يشرف على التحاليل",textAlign: TextAlign.center,),
                            analysis.isEmpty
                                ?SizedBox.shrink()
                                :Expanded(
                              child: ListView.separated(
                                itemCount: analysis.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 5,right: 5),
                                separatorBuilder: (_,__) => SizedBox(height: 10,),
                                itemBuilder: (context,i){
                                  return Material(
                                    elevation: 3,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    child: ListTile(
                                      title: Text(analysis[i].name, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                      subtitle: Text(DateFormat("yyyy-dd-MM").format(analysis[i].lastDate), style: TextStyle(fontSize: 14),),
                                      dense: true,
                                      trailing: Text(analysis[i].value),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 1.0,
                        color: Colors.black38,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(medicines.isEmpty?"لايوجد ادوية يشرف عليها":"يشرف على الادوية",textAlign: TextAlign.center,),
                            Expanded(
                              child: ListView.separated(
                                itemCount: medicines.length,
                                padding: EdgeInsets.only(left: 5,right: 5),
                                shrinkWrap: true,
                                separatorBuilder: (_,__) => SizedBox(height: 10,),
                                itemBuilder: (context,i){
                                  return Material(
                                    elevation: 3,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    child: ListTile(
                                      title: Text(medicines[i].name, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                      dense: true,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

            }
          ),
        ],
      ),
    );
  }
}
